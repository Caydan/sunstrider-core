/* Copyright (C) 2006 - 2008 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
*/

/* ScriptData
SDName: boss_timmy_the_cruel
SD%Complete: 100
SDComment:
SDCategory: Stratholme
EndScriptData */



#define SAY_SPAWN   "TIMMY!"

#define SPELL_RAVENOUSCLAW    17470

struct boss_timmy_the_cruelAI : public ScriptedAI
{
    boss_timmy_the_cruelAI(Creature *c) : ScriptedAI(c) {}

    uint32 RavenousClaw_Timer;
    bool HasYelled;

    void Reset()
    override {
        RavenousClaw_Timer = 10000;
        HasYelled = false;
    }

    void EnterCombat(Unit *who)
    override {
        if (!HasYelled)
        {
            me->Yell(SAY_SPAWN,LANG_UNIVERSAL,nullptr);
            HasYelled = true;
        }
    }

    void UpdateAI(const uint32 diff)
    override {
        //Return since we have no target
        if (!UpdateVictim())
            return;

        //RavenousClaw
        if (RavenousClaw_Timer < diff)
        {
            //Cast
            DoCast(me->GetVictim(),SPELL_RAVENOUSCLAW);
            //15 seconds until we should cast this again
            RavenousClaw_Timer = 15000;
        }else RavenousClaw_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};
CreatureAI* GetAI_boss_timmy_the_cruel(Creature *_Creature)
{
    return new boss_timmy_the_cruelAI (_Creature);
}

void AddSC_boss_timmy_the_cruel()
{
    OLDScript *newscript;
    newscript = new OLDScript;
    newscript->Name="boss_timmy_the_cruel";
    newscript->GetAI = &GetAI_boss_timmy_the_cruel;
    sScriptMgr->RegisterOLDScript(newscript);
}
