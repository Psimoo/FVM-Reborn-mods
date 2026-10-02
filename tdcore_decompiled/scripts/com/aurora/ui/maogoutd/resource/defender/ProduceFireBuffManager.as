package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class ProduceFireBuffManager
   {
      
      private static var _instance:ProduceFireBuffManager;
      
      private var m_dicBuffs:Object = {};
      
      public function ProduceFireBuffManager()
      {
         super();
         if(_instance)
         {
            throw new Error("ProduceFireBuffManager is singleton");
         }
      }
      
      public static function get instance() : ProduceFireBuffManager
      {
         if(!_instance)
         {
            _instance = new ProduceFireBuffManager();
         }
         return _instance;
      }
      
      public function UpdateBuffRange(sourceID:String, centerGrid:a_3491, xRange:int, yRange:int, FilterTarget:Function = null, SkillTarget:Function = null, OnOutOfRange:Function = null, bReapplyWhenInRange:Boolean = false) : void
      {
         var targetFieldGrid:a_3491 = null;
         var flower:a_3971 = null;
         var protector:a_3975 = null;
         var dx:int = 0;
         var dy:int = 0;
         var defense:a_3962 = null;
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
                  flower = targetFieldGrid.m_stFlowerDefense;
                  if(flower)
                  {
                     this.TryApplyBuffToTarget(sourceID,sourceBuff,flower,FilterTarget,SkillTarget,bReapplyWhenInRange);
                  }
                  protector = targetFieldGrid.m_stProtector;
                  if(protector)
                  {
                     this.TryApplyBuffToTarget(sourceID,sourceBuff,protector,FilterTarget,SkillTarget,bReapplyWhenInRange);
                  }
               }
            }
         }
         for(targetKey in sourceBuff)
         {
            defense = sourceBuff[targetKey] as a_3962;
            if(!defense || !defense.stFieldGrid)
            {
               delete sourceBuff[targetKey];
            }
            else
            {
               dx = Math.abs(defense.stFieldGrid.m_iXGridNo - centerGrid.m_iXGridNo);
               dy = Math.abs(defense.stFieldGrid.m_iYGridNo - centerGrid.m_iYGridNo);
               if(dx > xRange || dy > yRange)
               {
                  if(OnOutOfRange != null)
                  {
                     OnOutOfRange(defense);
                  }
                  delete sourceBuff[targetKey];
               }
            }
         }
      }
      
      private function TryApplyBuffToTarget(sourceID:String, sourceBuff:Object, defense:a_3962, FilterTarget:Function, SkillTarget:Function, bReapplyWhenInRange:Boolean) : void
      {
         if(!defense)
         {
            return;
         }
         if(FilterTarget != null && !FilterTarget(defense))
         {
            return;
         }
         var targetID:int = defense.m_iDefenseGlobalID;
         if(sourceBuff[targetID])
         {
            if(!bReapplyWhenInRange)
            {
               return;
            }
         }
         else
         {
            sourceBuff[targetID] = defense;
         }
         if(SkillTarget != null)
         {
            SkillTarget(sourceID,defense);
         }
      }
      
      public function RemoveBuffBySource(sourceID:String, OnRemove:Function = null) : void
      {
         var d:a_3962 = null;
         var sourceBuff:Object = this.m_dicBuffs[sourceID];
         if(!sourceBuff)
         {
            return;
         }
         for each(d in sourceBuff)
         {
            if(Boolean(d) && OnRemove != null)
            {
               OnRemove(d);
            }
         }
         delete this.m_dicBuffs[sourceID];
      }
      
      public function RemoveBuffTarget(sourceID:String, targetID:int) : void
      {
         var sourceBuff:Object = this.m_dicBuffs[sourceID];
         if(!sourceBuff)
         {
            return;
         }
         delete sourceBuff[targetID];
         if(this.IsEmpty(sourceBuff))
         {
            delete this.m_dicBuffs[sourceID];
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

