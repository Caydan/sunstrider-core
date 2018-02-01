//Mostly done, missing some visuals and not really fully tested


#include "def_temple_of_ahnqiraj.h"
 
#define CREATURE_OURO_MOUND     15712
#define CREATURE_OURO_SCARAB    15718
 
#define DISPLAYID_OURO          15509
#define DISPLAYID_MOUND         15294
 
#define SPELL_SWEEP             26103
#define SPELL_SANDBLAST         26102 //incorrect angle (must be 180°), core fix needed
#define SPELL_GROUND_RUPTURE    26100
#define SPELL_EMERGE            26262
#define SPELL_SUBMERGE          26063
#define SPELL_SUMMON_DIRTMOUNDS 26058 //unused
#define SPELL_BERSERK           26615 //incomplete effect
#define SPELL_BOULDER           26616
#define SPELL_QUAKE             26093 //incorrect damage
//missing hole visual
 
#define SWEEP_TIMER             15000 + rand()%5000
#define SANDBLAST_TIMER         25000 + rand()%10000
#define EMERGED_TIMER           90000
#define SUBMERGED_TIMER         35000 + rand()%10000
#define SCARABS_SPAWN_TIMER     15000
#define ANIM_TIMER              2000
#define IWANTATANK_TIMER1       8000
#define IWANTATANK_TIMER2       2000
#define QUAKE_TIMER             1000
#define NEWTARGET_TIMER         5000
 
enum PhasesOuro
{
    PHASE_EMERGED           =   1,
    PHASE_SUBMERGED         =   2,
    PHASE_ANIM_EMERGING     =   3,
    PHASE_BERSERK           =   4,
};
 
 
 
class boss_ouro : public CreatureScript
{
public:
    boss_ouro() : CreatureScript("boss_ouro")
    { }

    class boss_ouroAI : public ScriptedAI
    {
        public:
        SummonList Summons;
        uint16 Sweep_Timer;
        uint16 SandBlast_Timer;
        uint32 Emerged_Timer;
        uint32 Submerged_Timer;
        uint16 Scarabs_Spawn_Timer;
        uint16 Anim_Timer;
        uint32 IWantATank_Timer;
        uint16 Quake_Timer;
        uint16 NewTarget_Timer;
        uint8 Phase;
        uint16 Morphed_Timer;
        bool Morphed; //currently appearing as a mound
        const CreatureTemplate* cinfo;
        float homeX, homeY, homeZ;
     
        boss_ouroAI(Creature *c) : 
            ScriptedAI(c), 
            Summons(me),
            cinfo(me->GetCreatureTemplate())
        {
            me->GetHomePosition(homeX,homeY,homeZ,*new float());
            SetCombatMovementAllowed(false);
        }
     
        void Reset()
        override {
            me->SetDisplayId(DISPLAYID_MOUND);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            DoCast(me,SPELL_SUBMERGE,true);
            ResetAllTimers();
            Phase = PHASE_ANIM_EMERGING;
            Summons.DespawnAll();
        }
     
        void ResetAllTimers()
        {
            Sweep_Timer = rand()%5000;
            SandBlast_Timer = rand()%5000;
            Emerged_Timer = EMERGED_TIMER;
            Submerged_Timer = SUBMERGED_TIMER;
            Scarabs_Spawn_Timer = SCARABS_SPAWN_TIMER;
            Anim_Timer = ANIM_TIMER;
            IWantATank_Timer = IWANTATANK_TIMER1;
            Quake_Timer = QUAKE_TIMER;
            NewTarget_Timer = NEWTARGET_TIMER;
            Morphed_Timer = ANIM_TIMER;
        }
     
        void JustEngagedWith(Unit *who) override 
        {
            me->SetDisplayId(DISPLAYID_OURO);
            me->RemoveAurasDueToSpell(SPELL_SUBMERGE);
            DoCast(me, SPELL_EMERGE);
            DoZoneInCombat();
        }
     
        void UpdateAI(const uint32 diff) override 
        {
            if (me->IsNonMeleeSpellCast(false))
                return;
     
            if (!me->IsEngaged())
            {
                if (Quake_Timer < diff)
                {
                    DoCast(me, SPELL_QUAKE);
                    Quake_Timer = QUAKE_TIMER;
                }
                else
                    Quake_Timer -= diff;
                return;
            }
            else if (!UpdateVictim(false))
            {
                //Update Victim may return false if we got no melee target... we don't want to evade in that case; Only evade when threat list is empty
                if (!me->GetThreatManager().IsEngaged() || !me->_IsTargetAcceptable(me->GetVictim()) || me->CanCreatureAttack(me->GetVictim()) != CAN_ATTACK_RESULT_OK)
                {
                    EnterEvadeMode(EvadeReason::EVADE_REASON_OTHER);
                    return;
                }
            }
     
            if (me->HealthBelowPct(20) && !me->HasAuraEffect(SPELL_BERSERK, 0))
            {
                EnterPhase(PHASE_BERSERK);
            }
     
            switch (Phase)
            {
            case PHASE_EMERGED:
     
                if (GetMeleeVictim()) //if has melee victim, reset the timer
                    IWantATank_Timer = IWANTATANK_TIMER1;
     
                if (IWantATank_Timer < diff) {
                    Emerged_Timer = 0; //end phase
                } else IWantATank_Timer -= diff;
     
                if (Sweep_Timer < diff)
                {
                    DoCast(me, SPELL_SWEEP);
                    Sweep_Timer = SWEEP_TIMER;
                } else Sweep_Timer -= diff;
     
                if (SandBlast_Timer < diff)
                {
                    Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 90.0f, true);
                    if (target)
                    {
                        DoCast(target, SPELL_SANDBLAST);
                        SandBlast_Timer = SANDBLAST_TIMER;                
                    }
                } else SandBlast_Timer -= diff;
     
                if (Emerged_Timer < diff)
                {
                    EnterPhase(PHASE_SUBMERGED);
                } else Emerged_Timer -= diff;
     
                DoMeleeAttackIfReady();
                break;
     
            case PHASE_SUBMERGED:
     
                if (!Morphed && Submerged_Timer > 1000)
                {
                    if (Morphed_Timer <= diff)
                    {
                        me->SetDisplayId(DISPLAYID_MOUND);
                        Morphed = true;
                    } else Morphed_Timer -= diff;
                    return; //don't move yet, still playing anim
                }
     
                if (me->GetDistance(homeX,homeY,homeZ) > 150.0f)
                {
                    EnterEvadeMode(EvadeReason::EVADE_REASON_OTHER);
                }
     
                if (Quake_Timer < diff)
                {
                    DoCast(me, SPELL_QUAKE);
                    Quake_Timer = QUAKE_TIMER;
                } else Quake_Timer -= diff;
     
                float x, y, z;
                if (NewTarget_Timer < diff || !me->GetMotionMaster()->GetDestination(x,y,z) ) //= not moving anymore
                {
                    if (Submerged_Timer > 5000)
                    {
                        Unit* target = nullptr;
                        target = SelectTarget(SELECT_TARGET_RANDOM, 0, 200,true);
                        if (target)
                        {
                            NewTarget_Timer = NEWTARGET_TIMER;
                            //me->GetMotionMaster()->MoveChase(target); //buggy visual
                            target->GetPosition(x,y,z);
                            me->GetMotionMaster()->MovePoint(0,x,y,z);
                        }
                    } else {
                        me->GetMotionMaster()->Clear();
                    }
                } else NewTarget_Timer -= diff;
     
                //stop moving + set correct display id a bit before to avoid the progressive size changing effect. Ouro is currenly submerged so this is not visible.
                if (Morphed && Submerged_Timer < 1000)
                {
                    me->SetDisplayId(DISPLAYID_OURO);
                    me->GetMotionMaster()->Clear(true);
                    Morphed = false;
                }
     
                if (Submerged_Timer < diff)
                {
                    EnterPhase(PHASE_ANIM_EMERGING);
                }else Submerged_Timer -= diff;            
                break;
     
            case PHASE_ANIM_EMERGING:
     
                if (Anim_Timer < diff)
                {
                    EnterPhase(PHASE_EMERGED);
                } else Anim_Timer -= diff;
                break;
     
            case PHASE_BERSERK:
     
                if (!GetMeleeVictim())
                {
                    if (IWantATank_Timer < diff)
                    {
                        Unit* target = nullptr;
                        target = SelectTarget(SELECT_TARGET_RANDOM, 0, 120,true);
                        if(target)
                            DoCast(target, SPELL_BOULDER, false);
                        else //im so alone
                            EnterEvadeMode(EvadeReason::EVADE_REASON_OTHER);
     
                    } else IWantATank_Timer -= diff;
                } else IWantATank_Timer = IWANTATANK_TIMER2;
     
                if (Scarabs_Spawn_Timer < diff)
                {
                    SummonBugs(15);
                    Scarabs_Spawn_Timer = SCARABS_SPAWN_TIMER;
                } else Scarabs_Spawn_Timer -= diff;
     
                if (Sweep_Timer < diff)
                {
                    DoCast(me, SPELL_SWEEP);
                    Sweep_Timer = SWEEP_TIMER;
                }else Sweep_Timer -= diff;
     
                DoMeleeAttackIfReady();
                break;
            }
        }
     
        void EnterPhase(int NextPhase)
        {
            switch(NextPhase)
            {
            case PHASE_EMERGED:
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                break;
            case PHASE_SUBMERGED:
                Morphed = false;
                me->RemoveAllAuras();
                DoCast(me,SPELL_SUBMERGE,false);
                Submerged_Timer = SUBMERGED_TIMER;
                SummonMounds(4);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                NewTarget_Timer = 0;    
                break;
            case PHASE_ANIM_EMERGING:
                me->SetDisplayId(DISPLAYID_OURO);
                Morphed = false;
                me->RemoveAurasDueToSpell(SPELL_SUBMERGE);
                DoCast(me,SPELL_EMERGE,false);
                DoGroundRupture();
                SummonBugs(15);
                ResetAllTimers();
                break;
            case PHASE_BERSERK:
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                IWantATank_Timer = IWANTATANK_TIMER2;
                DoCast(me, SPELL_BERSERK);
                //hack +100% melee damage.
                /* FIXMEDMG, should be handled via aura
                if (cinfo)
                {
                    me->SetBaseWeaponDamage(BASE_ATTACK, MINDAMAGE, 2 * cinfo->mindmg);
                    me->SetBaseWeaponDamage(BASE_ATTACK, MAXDAMAGE, 2 * cinfo->maxdmg);
                    me->UpdateDamagePhysical(BASE_ATTACK);
                }
                */
                break;
            }
            Phase = NextPhase;
        }
     
        void EnterEvadeMode(EvadeReason /* why */)
        override {
            me->DisappearAndDie();
            me->Respawn();
        }
     
        void JustDied(Unit* /* who */)
        override {
            Summons.DespawnAll(); //not blizz!§§ but else this is just irksome
        }
     
        void SummonBugs(int amount)
        {
            for (int i = 0; i < amount; i++)
            {
                Unit* target = nullptr;
                target = SelectTarget(SELECT_TARGET_RANDOM, 0, 150, true);
                if(target)
                {
                    Creature* Bug = me->SummonCreature(CREATURE_OURO_SCARAB, target->GetPositionX(), target->GetPositionY(),
                        target->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 45000);
                    if (Bug)
                    {
                        Summons.Summon(Bug);
                        Bug->GetThreatManager().AddThreat(target, 1000000.0);
                    }
                }
            }
        }
       
        void SummonMounds(int amount)
        {
            for (int i = 0; i < amount; i++)
            {
                Creature* mound = DoSpawnCreature(CREATURE_OURO_MOUND, 0, 0, 0, 0, TEMPSUMMON_TIMED_DESPAWN, (Submerged_Timer - 5000));
                mound->AI()->DoZoneInCombat();
            }
        }
     
        void DoGroundRupture()
        {
            for (auto const& pair : me->GetCombatManager().GetPvECombatRefs())
            {
                Unit* target = pair.second->GetOther(me);
                if(target && me->IsWithinMeleeRange(target))
                {
                   DoCast(target, SPELL_GROUND_RUPTURE, true);
                }
            }
        }
     
        bool GetMeleeVictim()
        {
            if (me->IsWithinMeleeRange(me->GetVictim()))
                return true;
            else
            {
                Unit* target = nullptr;
                float MaxThreat = 0;
                for (auto itr : me->GetThreatManager().GetUnsortedThreatList())
                {
                    Unit* victim = itr->GetVictim();
                    if (me->IsWithinMeleeRange(victim))
                    {
                        if (itr->GetThreat() > MaxThreat)
                        {
                            target = victim;
                            MaxThreat = itr->GetThreat();
                        }
                    }
                }

                if (target)
                {
                    AttackStart(target);
                    return true;
                }
            }
            return false;
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new boss_ouroAI(creature);
    }
};

 
class boss_ouro_mound : public CreatureScript
{
public:
    boss_ouro_mound() : CreatureScript("boss_ouro_mound")
    { }

    class boss_ouro_moundAI : public ScriptedAI
    {
        public:
        uint16 Quake_Timer;
        uint16 NewTarget_Timer;
        Creature* Master;
     
        boss_ouro_moundAI(Creature *c) : ScriptedAI(c)
        {
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            Quake_Timer = 0;
            SetCombatMovementAllowed(false);
        }
        
        void JustEngagedWith(Unit* who) override {}
     
        void UpdateAI(const uint32 diff)    
        override {
            Unit* target = nullptr;
            if (NewTarget_Timer < diff || !me->isMoving())
            {
                target = SelectTarget(SELECT_TARGET_RANDOM, 0, 200.0f, true);
                NewTarget_Timer = NEWTARGET_TIMER;
            } else NewTarget_Timer -= diff;
     
            if (Quake_Timer < diff)
            {
                if (target)
                {
                    float x, y ,z;
                    //me->GetMotionMaster()->MoveChase(target); //buggy
                    target->GetPosition(x,y,z);
                    me->GetMotionMaster()->MovePoint(0,x,y,z);
                }
                DoCast(me, SPELL_QUAKE);
                Quake_Timer = QUAKE_TIMER;
            }else Quake_Timer -= diff;
        }
        void MoveInLineOfSight(Unit *who)
        override {
            me->GetThreatManager().AddThreat(who,0.0);
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new boss_ouro_moundAI(creature);
    }
};

 
void AddSC_boss_ouro()
{
 
    new boss_ouro();
 
    new boss_ouro_mound();
}