package com.aurora.ui.maogoutd.resource.defender.HorseYear.soulpuppet
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class SoulPuppetTargetHelper
   {
      
      private static var m_chainNodes:Array = [];
      
      private static var nodeLength:int = 19;
      
      public function SoulPuppetTargetHelper()
      {
         super();
      }
      
      public static function FindTarget(grid:a_3491) : a_4206
      {
         var m:a_4206 = null;
         if(!grid)
         {
            return null;
         }
         var bosses:Array = [];
         var normals:Array = [];
         for each(m in grid.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector)
         {
            if(!(!m || m.iLifeValue <= 0 || !m.m_stCurrentFieldGrid || m.iIntruderState == -10))
            {
               if(m.IsBossIntruder)
               {
                  bosses.push(m);
               }
               else if(m.visible)
               {
                  normals.push(m);
               }
            }
         }
         if(bosses.length > 0)
         {
            bosses.sort(sortByHpAsc);
            return bosses[0];
         }
         if(normals.length > 0)
         {
            normals.sort(sortByHpDescThenDistance(grid));
            return normals[0];
         }
         return null;
      }
      
      private static function sortByHpAsc(a:a_4206, b:a_4206) : int
      {
         return a.iLifeValue - b.iLifeValue;
      }
      
      private static function sortByHpDescThenDistance(grid:a_3491) : Function
      {
         return function(a:a_4206, b:a_4206):int
         {
            if(a.iLifeValue != b.iLifeValue)
            {
               return b.iLifeValue - a.iLifeValue;
            }
            var da:* = Distance(a,grid);
            var db:* = Distance(b,grid);
            return da - db;
         };
      }
      
      private static function Distance(m:a_4206, grid:a_3491) : Number
      {
         var orgx:Number = grid.m_iXGridNo * a_3491.a_1080;
         var orgy:Number = grid.m_iYGridNo * a_3491.a_1081;
         var dx:Number = m.x - orgx;
         var dy:Number = m.y - orgy;
         return dx * dx + dy * dy;
      }
      
      internal static function GetGlobalSoulPuppetIntruder(grid:a_3491) : a_4206
      {
         var i:int = 0;
         var j:int = 0;
         var stFieldGrid:a_3491 = null;
         if(!grid)
         {
            return null;
         }
         var stFieldGridVector:Array = grid.m_stCurrentBattbleFieldView.stFieldGridsVector;
         loop0:
         for(i = 0; i < BattleFieldView.a_1012; )
         {
            j = 0;
            while(true)
            {
               if(j >= BattleFieldView.a_1011)
               {
                  i++;
                  continue loop0;
               }
               stFieldGrid = stFieldGridVector[i][j];
               if(Boolean(stFieldGrid) && stFieldGrid.m_SoulPuppetIntruder != null)
               {
                  break;
               }
               j++;
            }
            return stFieldGrid.m_SoulPuppetIntruder;
         }
         return null;
      }
      
      public static function UpdateChainNodes(grid:a_3491, m_linkTarget:a_4206) : void
      {
         var rot:Number = NaN;
         var py:Number = NaN;
         var a:int = 0;
         var n:SoulPuppetSingleEffect = null;
         var r:* = 0;
         var d:SoulPuppetSingleEffect = null;
         var node:SoulPuppetSingleEffect = null;
         if(!m_chainNodes || !grid || !m_linkTarget)
         {
            return;
         }
         var startX:Number = (grid.m_iXGridNo + 0.5) * a_3491.a_1080;
         var startY:Number = (grid.m_iYGridNo + 0.5) * a_3491.a_1081;
         var endX:Number = m_linkTarget.x + 0.5 * m_linkTarget.width + m_linkTarget.stDisplayBitmap.x;
         var endY:Number = m_linkTarget.y + 0.5 * m_linkTarget.height + m_linkTarget.stDisplayBitmap.y;
         var dx:Number = endX - startX;
         var dy:Number = endY - startY;
         var dist:Number = Math.sqrt(dx * dx + dy * dy);
         if(dist <= 0)
         {
            return;
         }
         var needCount:int = Math.floor(dist / nodeLength);
         if(needCount < 1)
         {
            needCount = 1;
         }
         var totalCount:int = int(m_chainNodes.length);
         var reversed:Boolean = startX > endX;
         if(totalCount < needCount)
         {
            for(a = totalCount; a < needCount; a++)
            {
               n = SoulPuppetSingleEffect.a_3926();
               n.a_1797(reversed);
               grid.m_stCurrentBattbleFieldView.AddToBattleView(n,BattleLayerDefine.EFFECTS_BASE_TYPE,grid);
               m_chainNodes.push(n);
            }
            totalCount = needCount;
         }
         if(totalCount > needCount)
         {
            for(r = int(totalCount - 1); r >= needCount; r--)
            {
               d = m_chainNodes[r];
               if(d)
               {
                  d.a_3940();
               }
               m_chainNodes.pop();
            }
            totalCount = needCount;
         }
         var dirX:Number = dx / dist;
         var dirY:Number = dy / dist;
         rot = Math.atan2(dy,dx) * 180 / Math.PI;
         var px:Number = startX;
         py = startY;
         for(var i:int = 0; i < totalCount; i++)
         {
            node = m_chainNodes[i];
            px += dirX * nodeLength;
            py += dirY * nodeLength;
            node.x = px;
            node.y = py;
            node.visible = m_linkTarget.visible;
            node.rotation = rot;
         }
      }
      
      public static function ClearChainNodes() : void
      {
         var n:SoulPuppetSingleEffect = null;
         if(!m_chainNodes)
         {
            return;
         }
         for(var i:* = int(m_chainNodes.length - 1); i >= 0; i--)
         {
            n = m_chainNodes[i];
            if(n)
            {
               n.a_3940();
            }
         }
         m_chainNodes.length = 0;
      }
   }
}

