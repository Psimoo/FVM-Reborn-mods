package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   
   public class AttackBuffManager
   {
      
      private static var _instance:AttackBuffManager;
      
      private var m_dicBuffs:Object = {};
      
      public function AttackBuffManager()
      {
         super();
         if(_instance)
         {
            throw new Error("AttackBuffManager is singleton");
         }
      }
      
      public static function get instance() : AttackBuffManager
      {
         if(!_instance)
         {
            _instance = new AttackBuffManager();
         }
         return _instance;
      }
      
      public function AddBuffBySource(sourceID:String, target:a_3953, rate:Number) : void
      {
         if(!target)
         {
            return;
         }
         var targetID:int = target.m_iDefenseGlobalID;
         if(!this.m_dicBuffs[sourceID])
         {
            this.m_dicBuffs[sourceID] = {};
         }
         var sourceBuff:Object = this.m_dicBuffs[sourceID];
         if(sourceBuff[targetID])
         {
            return;
         }
         sourceBuff[targetID] = target;
         target.AddAttackBuffFromSource(sourceID,rate);
      }
      
      public function RemoveBuffTarget(sourceID:String, targetID:int) : void
      {
         var sourceBuff:Object = this.m_dicBuffs[sourceID];
         if(!sourceBuff)
         {
            return;
         }
         var target:a_3953 = sourceBuff[targetID];
         if(target)
         {
            target.RemoveAttackBuffFromSource(sourceID);
         }
         delete sourceBuff[targetID];
         if(this.IsEmpty(sourceBuff))
         {
            delete this.m_dicBuffs[sourceID];
         }
      }
      
      public function RemoveBuffBySource(sourceID:String) : void
      {
         var target:a_3953 = null;
         var sourceBuff:Object = this.m_dicBuffs[sourceID];
         if(!sourceBuff)
         {
            return;
         }
         for each(target in sourceBuff)
         {
            if(target)
            {
               target.RemoveAttackBuffFromSource(sourceID);
            }
         }
         delete this.m_dicBuffs[sourceID];
      }
      
      public function UpdateBuffRange(sourceID:String, centerGrid:a_3491, xRange:int, yRange:int, FilterTarget:Function = null, SkillTarget:Function = null, bReapplyWhenInRange:Boolean = false, OnOutOfRange:Function = null) : void
      {
         var targetFieldGrid:a_3491 = null;
         var stAttackFighter:a_3953 = null;
         var targetID:int = 0;
         var dx:int = 0;
         var dy:int = 0;
         var targetKey:String = null;
         var iXGrid:int = 0;
         if(!centerGrid)
         {
            return;
         }
         if(!this.m_dicBuffs[sourceID])
         {
            this.m_dicBuffs[sourceID] = {};
         }
         var sourceBuff:Object = this.m_dicBuffs[sourceID];
         var iStartXGridNo:int = Math.max(centerGrid.m_iXGridNo - xRange,0);
         var iEndXGridNo:int = Math.min(centerGrid.m_iXGridNo + xRange,BattleFieldView.a_1011 - 1);
         var iStartYGridNo:int = Math.max(centerGrid.m_iYGridNo - yRange,0);
         var iEndYGridNo:int = Math.min(centerGrid.m_iYGridNo + yRange,BattleFieldView.a_1012 - 1);
         var stFieldGridsVector:Array = centerGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var iYGrid:int = iStartYGridNo; iYGrid <= iEndYGridNo; iYGrid++)
         {
            for(iXGrid = iStartXGridNo; iXGrid <= iEndXGridNo; iXGrid++)
            {
               targetFieldGrid = stFieldGridsVector[iYGrid][iXGrid];
               if(targetFieldGrid)
               {
                  stAttackFighter = targetFieldGrid.m_stAttackFighter;
                  if(!(!stAttackFighter || stAttackFighter is a_3924 || !stAttackFighter.canReceiveAttackBuff))
                  {
                     if(!(FilterTarget != null && !FilterTarget(stAttackFighter)))
                     {
                        targetID = stAttackFighter.m_iDefenseGlobalID;
                        if(sourceBuff[targetID])
                        {
                           if(!bReapplyWhenInRange)
                           {
                              continue;
                           }
                        }
                        else
                        {
                           sourceBuff[targetID] = stAttackFighter;
                        }
                        if(SkillTarget != null)
                        {
                           SkillTarget(sourceID,stAttackFighter);
                        }
                     }
                  }
               }
            }
         }
         for(targetKey in sourceBuff)
         {
            stAttackFighter = sourceBuff[targetKey];
            if(!(!stAttackFighter || !stAttackFighter.stFieldGrid))
            {
               dx = Math.abs(stAttackFighter.stFieldGrid.m_iXGridNo - centerGrid.m_iXGridNo);
               dy = Math.abs(stAttackFighter.stFieldGrid.m_iYGridNo - centerGrid.m_iYGridNo);
               if(dx > xRange || dy > yRange)
               {
                  if(OnOutOfRange != null)
                  {
                     OnOutOfRange(sourceID,stAttackFighter);
                  }
                  stAttackFighter.RemoveAttackBuffFromSource(sourceID);
                  delete sourceBuff[targetKey];
               }
            }
         }
      }
      
      private function IsEmpty(obj:Object) : Boolean
      {
         var key:String = null;
         var _loc3_:int = 0;
         var _loc4_:* = obj;
         for(key in _loc4_)
         {
            return false;
         }
         return true;
      }
   }
}

