
#include "def_black_temple.h"

#define EMOTE_NEW_TARGET             -1564010
#define EMOTE_PUNCH_GROUND           -1564011                //DoScriptText(EMOTE_PUNCH_GROUND, me);
#define EMOTE_GROUND_CRACK           -1564012

//Spells
#define SPELL_MOLTEN_PUNCH           40126 // Summon flamme
#define SPELL_HATEFUL_STRIKE         41926
#define SPELL_MOLTEN_FLAME           40980
#define SPELL_VOLCANIC_ERUPTION      40117 // eruption visual aura + trigger SPELL_VOLCANIC_GEYSER (modified duration index)
#define SPELL_VOLCANIC_GEYSER        42055 //18 secs aura triggered by SPELL_VOLCANIC_ERUPTION (trigger SPELL_VOLCANIC_GEYSER_DAMAGE every sec)
#define SPELL_VOLCANIC_GEYSER_DAMAGE 42052
#define SPELL_VOLCANIC_SUMMON        40276 // (modified duration index)
#define SPELL_BERSERK                45078
#define SPELL_CHARGE                 41581

#define TIMER_VOLCANO                10000
#define TIMER_VOLCANO_FIRST          2500
#define TIMER_HATEFUL_STRIKE         5000
#define TIMER_BERSERK                900000 // 15 minute enrage
#define TIMER_MOLTEN_PUNCH           20000
#define TIMER_PHASE_LENGHT           60000
#define TIMER_SWITCH_TARGET          10000

#define CREATURE_VOLCANO             23085
#define CREATURE_STALKER             23095 //summoned by molten punch, has CREATURE_FLAG_EXTRA_TRIGGER and spell[0]=40980 -> cast it at spawn

// spell SPELL_MOLTEN_FLAME is set in database and is autocasted at spawn



class boss_supremus : public CreatureScript
{
public:
    boss_supremus() : CreatureScript("boss_supremus")
    { }

    class boss_supremusAI : public ScriptedAI
    {
        public:
        boss_supremusAI(Creature *c) : ScriptedAI(c), summons(me)
        {
            pInstance = ((InstanceScript*)c->GetInstanceScript());
        }
    
        InstanceScript* pInstance;
    
        uint32 SummonFlameTimer;
        uint32 SwitchTargetTimer;
        uint32 PhaseSwitchTimer;
        uint32 SummonVolcanoTimer;
        uint32 HatefulStrikeTimer;
        uint32 BerserkTimer;
    
        uint8 currentPhase;
    
        SummonList summons;
    
        enum SupremusPhase
        {
            PHASE_1, //Normal tanking
            PHASE_2, //Running around with random targets
        };
    
        void Reset()
        override {
            if(pInstance && me->IsAlive())
                pInstance->SetData(DATA_SUPREMUSEVENT, NOT_STARTED);
    
            PhaseSwitchTimer = TIMER_PHASE_LENGHT;
            HatefulStrikeTimer = TIMER_HATEFUL_STRIKE;
            SummonFlameTimer = TIMER_MOLTEN_PUNCH;
            SwitchTargetTimer = TIMER_SWITCH_TARGET;
            SummonVolcanoTimer = TIMER_VOLCANO_FIRST;
            BerserkTimer = TIMER_BERSERK;                              // 15 minute enrage
    
            SetPhase(PHASE_1);
    
            StopEruptions();
            summons.DespawnAll();
        }
    
        void JustEngagedWith(Unit *who)
        override {
            DoZoneInCombat();
    
            if(pInstance)
                pInstance->SetData(DATA_SUPREMUSEVENT, IN_PROGRESS);
        }
    
        void JustDied(Unit *killer)
        override {
            if(pInstance)
                pInstance->SetData(DATA_SUPREMUSEVENT, DONE);
    
            summons.DespawnAll();
        }
    
        void JustSummoned(Creature *summon) 
        override {
            summons.Summon(summon);
        }
    
        void SummonedCreatureDespawn(Creature *summon) 
        override {
            summons.Despawn(summon);
        }
    
        void StopEruptions()
        {
            for(auto cGUID : summons)
            {
                Creature* volcano = me->GetMap()->GetCreature(cGUID);
                if(volcano && volcano->HasAura(SPELL_VOLCANIC_ERUPTION))
                    volcano->RemoveAura(SPELL_VOLCANIC_ERUPTION); //remove visual
                if(volcano && volcano->HasAura(SPELL_VOLCANIC_GEYSER))
                    volcano->RemoveAura(SPELL_VOLCANIC_GEYSER); //remove damage effect
            }
        }
    
        Player* CalculateHatefulStrikeTarget()
        {
            uint32 maxhealthfound = 0;
            Player* target = nullptr;

            for (auto const& pair : me->GetCombatManager().GetPvECombatRefs())
            {
                Player* p = pair.second->GetOther(me)->ToPlayer();
                if (!p) //ref may not be a player
                    continue;
    
                if(p && me->IsWithinMeleeRange(p))
                {
                    if(p->GetHealth() > maxhealthfound)
                    {
                        maxhealthfound = p->GetHealth();
                        target = p;
                    }
                }
            }
    
            return target;
        }
    
        void ChaseNewRandomTarget()
        {
            if(Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 1, 100, true))
            {
                if(me->GetDistance2d(me->GetVictim()) > 40)
                    me->CastSpell(me->GetVictim(),SPELL_CHARGE, TRIGGERED_NONE);
                            
                ResetThreatList();
                me->GetThreatManager().AddThreat(target, 5000000.0f);
                DoScriptText(EMOTE_NEW_TARGET, me);
                SwitchTargetTimer = TIMER_SWITCH_TARGET;
            }
        }
    
        void SetPhase(uint8 phase)
        {
            if(phase == 1)
            {
                currentPhase = 1;
                PhaseSwitchTimer = TIMER_PHASE_LENGHT;
                me->SetSpeedRate(MOVE_RUN, 1.2f);
                me->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_TAUNT, false);
                me->ApplySpellImmune(0, IMMUNITY_EFFECT,SPELL_EFFECT_ATTACK_ME, false);
                if(me->IsInCombat())
                {
                    // StopEruptions(); //seems to be non blizz
                    ResetThreatList();
                    DoZoneInCombat();
                    DoScriptText(EMOTE_PUNCH_GROUND, me);
                }
            }
            else if(phase == 2)
            {
                currentPhase = 2;
                PhaseSwitchTimer = TIMER_PHASE_LENGHT;
                ResetThreatList();
                SwitchTargetTimer = TIMER_SWITCH_TARGET;
                SummonVolcanoTimer = TIMER_VOLCANO_FIRST;
                me->SetSpeedRate(MOVE_RUN, 0.9f);
                DoZoneInCombat();
                me->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_TAUNT, true);
                me->ApplySpellImmune(0, IMMUNITY_EFFECT,SPELL_EFFECT_ATTACK_ME, true);
                SwitchTargetTimer = 0;
            }
        }
    
        void UpdateAI(const uint32 diff)
        override {
            if (!UpdateVictim())
                return;
            
            if(PhaseSwitchTimer < diff)
            {
                SetPhase(currentPhase == PHASE_1 ? PHASE_2 : PHASE_1);
            }else PhaseSwitchTimer -= diff;
    
            if(BerserkTimer < diff)
            {
                if(!me->HasAuraEffect(SPELL_BERSERK, 0))
                    DoCast(me, SPELL_BERSERK);
            }
            else BerserkTimer -= diff;
    
            if(SummonFlameTimer < diff)
            {
                DoCast(me, SPELL_MOLTEN_PUNCH);
                SummonFlameTimer = TIMER_MOLTEN_PUNCH;
            }else SummonFlameTimer -= diff;
    
            switch(currentPhase)
            {
            case PHASE_1:
    
                if(HatefulStrikeTimer < diff)
                {
                    if(Player* target = CalculateHatefulStrikeTarget())
                    {
                        DoCast(target, SPELL_HATEFUL_STRIKE);
                        HatefulStrikeTimer = TIMER_HATEFUL_STRIKE;
                    }
                }else HatefulStrikeTimer -= diff;
    
                break;
            case PHASE_2:
    
                if(SwitchTargetTimer < diff)
                {
                    ChaseNewRandomTarget();
                } else SwitchTargetTimer -= diff;
    
                if(SummonVolcanoTimer < diff)
                {
                    if(Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 150.0f, true))
                    {
                        DoCast(target, SPELL_VOLCANIC_SUMMON);
                        DoScriptText(EMOTE_GROUND_CRACK, me);
                        SummonVolcanoTimer = TIMER_VOLCANO;
                    }
                } else SummonVolcanoTimer -= diff;
    
                break;
            }
    
            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new boss_supremusAI(creature);
    }
};


class molten_flame : public CreatureScript
{
public:
    molten_flame() : CreatureScript("molten_flame")
    { }

    class molten_flameAI : public ScriptedAI
    {
        public:
        InstanceScript* pInstance;
        ObjectGuid currentTargetGUID;
        
        float x, y, z, groundZ;
    
        molten_flameAI(Creature *c) : ScriptedAI(c)
        {
            pInstance = ((InstanceScript*)c->GetInstanceScript());
        }
        
        void UndermapCheck()
        {
    
            x = me->GetPositionX();
            y = me->GetPositionY();
            z = me->GetPositionZ();
            groundZ = z;
                
            me->UpdateGroundPositionZ(x, z, groundZ);
                
            if (z < groundZ)
                DoTeleportTo(x, y, groundZ);
    
        }
    
        void Reset() 
        override {
            UndermapCheck();
            me->SetReactState(REACT_PASSIVE);
        }
    
        void RandomizeTarget()
        {
            if(!pInstance) 
                return;
    
            DoZoneInCombat();
            Creature* supremus = me->GetMap()->GetCreature(ObjectGuid(pInstance->GetData64(DATA_SUPREMUS)));
            if(!supremus) 
                return;
            
            Unit* currentTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, [&](Unit* target) {  //take target between 20 and 100 yards
                return target->IsAlive()
                    && target->GetTypeId() == TYPEID_PLAYER
                    && me->IsWithinCombatRange(target, 100.0f)
                    && !me->IsWithinCombatRange(target, 20.0f);
            });

            if(!currentTarget)
                currentTarget = supremus->AI()->SelectTarget(SELECT_TARGET_RANDOM, 0, 100.0f, true); //if not target found, skip minimum limit
    
            if(currentTarget)
            {
                currentTargetGUID = currentTarget->GetGUID();
                /* TODOMOV
                me->GetMotionMaster()->MoveFollowOnPoint(currentTarget);
                */
                me->GetMotionMaster()->MoveFollow(currentTarget, 0.0f, 0);
            }
        }
        
        void UpdateAI(uint32 const diff)
        override {
            //change target if we reached it
            Player* p = me->GetMap()->GetPlayer(currentTargetGUID);
            if(!p || me->GetDistance(p) < 2.0f)
                RandomizeTarget();
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new molten_flameAI(creature);
    }
};


class npc_volcano : public CreatureScript
{
public:
    npc_volcano() : CreatureScript("npc_volcano")
    { }

    class npc_volcanoAI : public ScriptedAI
    {
        public:
        npc_volcanoAI(Creature *c) : ScriptedAI(c)
        { }
         
        uint32 UnderMapCheckTimer;
        uint32 startTimer;
        
        float currentX, currentY, currentZ, groundZ;
    
        void Reset()
        override {
            UnderMapCheckTimer = 0;
    
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
    
            me->SetReactState(REACT_PASSIVE);
    
            startTimer = 1500;
        }
        
        void UndermapCheck()
        {
            currentX = me->GetPositionX();
            currentY = me->GetPositionY();
            currentZ = me->GetPositionZ();
            groundZ = currentZ;
                
            me->UpdateGroundPositionZ(currentX, currentY, groundZ);
                
            if (currentZ < groundZ)
                DoTeleportTo(currentX, currentY, groundZ);
        }
    
        void UpdateAI(const uint32 diff)
        override {        
            if (UnderMapCheckTimer < diff)
            {
                UndermapCheck();                
                UnderMapCheckTimer = 750;
            }else UnderMapCheckTimer -= diff;
    
            if (startTimer)
            { 
                if(startTimer <= diff)
                {
                    DoCast(me, SPELL_VOLCANIC_ERUPTION, true);
                    startTimer = 0;
                } else startTimer -= diff;
            } 
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_volcanoAI(creature);
    }
};


void AddSC_boss_supremus()
{
    new boss_supremus();

    new molten_flame();

    new npc_volcano();
}

