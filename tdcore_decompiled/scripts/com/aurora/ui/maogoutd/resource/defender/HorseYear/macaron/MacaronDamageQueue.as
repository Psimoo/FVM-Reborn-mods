package com.aurora.ui.maogoutd.resource.defender.HorseYear.macaron
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class MacaronDamageQueue
   {
      
      internal static const m_arrCheckMouse:Array = new Array(8389109,8389110,8389111,8389112,8389113,8389114,8389115,8389116,8388707,8388708,8388709,8388710,8393108,8393109,8393110,8393111,8393112,8393113,8393114,8393115,8393116,8393117,8393118);
      
      private const DAMAGE_COUNT:int = 10;
      
      private var m_iStartTime:int = -1;
      
      private var m_stBattleView:BattleFieldView;
      
      private var m_iTrans:int;
      
      private var a_1579:int = 0;
      
      private var m_iDamageCount:int = 0;
      
      private var m_iHasDamage:int = 0;
      
      private var m_iXGridNo:int = 0;
      
      private var m_iYGridNo:int = 0;
      
      public function MacaronDamageQueue()
      {
         super();
      }
      
      public function InitData(grid:a_3491, trans:int, iHurtPower:int) : void
      {
         this.m_stBattleView = grid.m_stCurrentBattbleFieldView;
         this.m_iXGridNo = grid.m_iXGridNo;
         this.m_iYGridNo = grid.m_iYGridNo;
         this.m_iTrans = trans;
         this.a_1579 = iHurtPower;
         this.m_iStartTime = -1;
         this.m_iDamageCount = 0;
         this.m_iHasDamage = 0;
      }
      
      public function CreateDamage() : void
      {
         var damage:int = 0;
         ++this.m_iDamageCount;
         if(this.m_iDamageCount == this.DAMAGE_COUNT)
         {
            this.DamageRange(this.a_1579 - this.m_iHasDamage);
         }
         else
         {
            damage = this.a_1579 / this.DAMAGE_COUNT;
            this.DamageRange(damage);
         }
      }
      
      public function HasFinish() : Boolean
      {
         return this.m_iDamageCount >= this.DAMAGE_COUNT;
      }
      
      private function DamageRange(damage:int) : void
      {
         var j:int = 0;
         this.m_iHasDamage += damage;
         for(var i:int = this.m_iXGridNo - 1; i <= this.m_iXGridNo + 1; i++)
         {
            for(j = this.m_iYGridNo - 1; j <= this.m_iYGridNo + 1; j++)
            {
               this.DamageGrid(this.m_stBattleView.a_3438(i,j),damage);
            }
         }
      }
      
      private function DamageGrid(stTargetFieldGrid:a_3491, damage:*) : void
      {
         var stMoveIntruder:a_4206 = null;
         if(stTargetFieldGrid == null)
         {
            return;
         }
         var arrMoveIntruder:Array = stTargetFieldGrid.a_1511.slice();
         for each(stMoveIntruder in arrMoveIntruder)
         {
            if(null != stMoveIntruder)
            {
               if(this.m_iTrans == 1)
               {
                  if(0 == stMoveIntruder.iSpaceState)
                  {
                     this.DamageMouse(stMoveIntruder,damage);
                  }
               }
               else if(0 == stMoveIntruder.iSpaceState || 3 == stMoveIntruder.iSpaceState)
               {
                  this.DamageMouse(stMoveIntruder,damage);
               }
            }
         }
      }
      
      private function DamageMouse(stMoveIntruder:a_4206, damage:int) : void
      {
         if(stMoveIntruder.isCannotSeeByFighter)
         {
            return;
         }
         stMoveIntruder.a_4208(b_182.a_432,2);
         var finalHurt:int = damage;
         if(this.m_iTrans != 1 && m_arrCheckMouse.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1)
         {
            finalHurt *= 2;
         }
         stMoveIntruder.a_3969(finalHurt);
      }
   }
}

