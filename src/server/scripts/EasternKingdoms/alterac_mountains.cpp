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
SDName: Alterac_Mountains
SD%Complete: 100
SDComment: Quest support: 6681
SDCategory: Alterac Mountains
EndScriptData */

/* ContentData
npc_ravenholdt
EndContentData */



/*######
## npc_ravenholdt
######*/

struct npc_ravenholdtAI : public ScriptedAI
{
    npc_ravenholdtAI(Creature *c) : ScriptedAI(c) {}

    void Reset() override { }

    void MoveInLineOfSight(Unit *who) override
    {
        if( who->GetTypeId() == TYPEID_PLAYER )
            if( (who)->ToPlayer()->GetQuestStatus(6681) == QUEST_STATUS_INCOMPLETE )
                (who)->ToPlayer()->KilledMonsterCredit(me->GetEntry(),me->GetGUID() );
    }
};

CreatureAI* GetAI_npc_ravenholdt(Creature *pCreature)
{
    return new npc_ravenholdtAI (pCreature);
}

void AddSC_alterac_mountains()
{
    OLDScript *newscript;

    newscript = new OLDScript;
    newscript->Name="npc_ravenholdt";
    newscript->GetAI = &GetAI_npc_ravenholdt;
    sScriptMgr->RegisterOLDScript(newscript);
}
