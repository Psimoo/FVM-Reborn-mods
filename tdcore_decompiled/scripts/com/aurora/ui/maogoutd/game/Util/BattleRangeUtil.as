package com.aurora.ui.maogoutd.game.Util
{
   public class BattleRangeUtil
   {
      
      public function BattleRangeUtil()
      {
         super();
      }
      
      public static function FixAllRange(arr1:Array) : Array
      {
         var arr2:Array = [];
         for(var i:int = 0; i < arr1.length; i++)
         {
            if(i == 0)
            {
               arr2.push(FixOneRange(arr1[arr1.length - 1],arr1[i],arr1[i + 1]));
            }
            else if(i == arr1.length - 1)
            {
               arr2.push(FixOneRange(arr1[i - 1],arr1[i],arr1[0]));
            }
            else
            {
               arr2.push(FixOneRange(arr1[i - 1],arr1[i],arr1[i + 1]));
            }
         }
         return arr2;
      }
      
      public static function FixOneRange(left:Array, now:Array, right:Array) : Array
      {
         var next:Array = [0,0];
         if(left[0] < now[0] && right[0] > now[0] || right[0] < now[0] && left[0] > now[0])
         {
            next[0] = now[0];
         }
         else if(left[0] >= now[0] && right[0] >= now[0])
         {
            next[0] = now[0] - 0.5;
         }
         else
         {
            next[0] = now[0] + 0.5;
         }
         if(left[1] < now[1] && right[1] > now[1] || right[1] < now[1] && left[1] > now[1])
         {
            next[1] = now[1];
         }
         else if(left[1] >= now[1] && right[1] >= now[1])
         {
            next[1] = now[1] - 0.5;
         }
         else
         {
            next[1] = now[1] + 0.5;
         }
         return next;
      }
      
      public static function MaxConvexRegion(points:Array) : Object
      {
         var n:int;
         var hull:Array;
         var t:int;
         var area:Number;
         var B:int;
         var I:int;
         var totalGrid:int;
         var i:int = 0;
         var cross:Function = function(o:Array, a:Array, b:Array):Number
         {
            return (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0]);
         };
         var polygonArea:Function = function(poly:Array):Number
         {
            var j:int = 0;
            var area:Number = 0;
            for(var i:int = 0; i < poly.length; i++)
            {
               j = (i + 1) % poly.length;
               area += poly[i][0] * poly[j][1] - poly[j][0] * poly[i][1];
            }
            return Math.abs(area) / 2;
         };
         var boundaryPoints:Function = function(poly:Array):int
         {
            var j:int = 0;
            var dx:int = 0;
            var dy:int = 0;
            var total:int = 0;
            for(var i:int = 0; i < poly.length; i++)
            {
               j = (i + 1) % poly.length;
               dx = Math.abs(poly[i][0] - poly[j][0]);
               dy = Math.abs(poly[i][1] - poly[j][1]);
               total += gcd(dx,dy);
            }
            return total;
         };
         var gcd:Function = function(a:int, b:int):int
         {
            var tmp:int = 0;
            while(b != 0)
            {
               tmp = a % b;
               a = b;
               b = tmp;
            }
            return a;
         };
         points.sort(function(a:Array, b:Array):int
         {
            return a[0] == b[0] ? int(a[1] - b[1]) : int(a[0] - b[0]);
         });
         n = int(points.length);
         hull = [];
         for(i = 0; i < n; i++)
         {
            while(hull.length >= 2 && cross(hull[hull.length - 2],hull[hull.length - 1],points[i]) <= 0)
            {
               hull.pop();
            }
            hull.push(points[i]);
         }
         t = hull.length + 1;
         for(i = n - 2; i >= 0; i--)
         {
            while(hull.length >= t && cross(hull[hull.length - 2],hull[hull.length - 1],points[i]) <= 0)
            {
               hull.pop();
            }
            hull.push(points[i]);
         }
         hull.pop();
         area = polygonArea(hull);
         B = boundaryPoints(hull);
         I = area - B / 2 + 1;
         totalGrid = I + B;
         return {
            "area":area,
            "gridCount":totalGrid,
            "hullPoints":hull
         };
      }
      
      public static function GetCoveredCells(hull:Array, points:Array) : Array
      {
         var p:Array = null;
         var cells:Array = null;
         var x:int = 0;
         var y:int = 0;
         var cellCenter:Array = null;
         var cellCenter1:Array = null;
         var cellCenter2:Array = null;
         var cellCenter3:Array = null;
         var cellCenter4:Array = null;
         var minX:int = int.MAX_VALUE;
         var maxX:int = int.MIN_VALUE;
         var minY:int = int.MAX_VALUE;
         var maxY:int = int.MIN_VALUE;
         for each(p in points)
         {
            if(p[0] < minX)
            {
               minX = int(p[0]);
            }
            if(p[0] > maxX)
            {
               maxX = int(p[0]);
            }
            if(p[1] < minY)
            {
               minY = int(p[1]);
            }
            if(p[1] > maxY)
            {
               maxY = int(p[1]);
            }
         }
         cells = [];
         for(x = minX; x <= maxX; x++)
         {
            for(y = minY; y <= maxY; y++)
            {
               cellCenter = [x,y];
               cellCenter1 = [x - 0.3,y];
               cellCenter2 = [x + 0.3,y];
               cellCenter3 = [x,y - 0.3];
               cellCenter4 = [x,y + 0.3];
               if(PointInPolygon(cellCenter,hull) || PointOnPolygonEdge(cellCenter,hull) || PointInPolygon(cellCenter1,hull) || PointOnPolygonEdge(cellCenter1,hull) || PointInPolygon(cellCenter2,hull) || PointOnPolygonEdge(cellCenter2,hull) || PointInPolygon(cellCenter3,hull) || PointOnPolygonEdge(cellCenter3,hull) || PointInPolygon(cellCenter4,hull) || PointOnPolygonEdge(cellCenter4,hull))
               {
                  cells.push([x,y]);
               }
            }
         }
         return cells;
      }
      
      public static function PointOnPolygonEdge(pt:Array, poly:Array) : Boolean
      {
         var xi:Number = NaN;
         var yi:Number = NaN;
         var xj:Number = NaN;
         var yj:Number = NaN;
         var i:* = 0;
         var j:int = poly.length - 1;
         while(i < poly.length)
         {
            xi = Number(poly[i][0]);
            yi = Number(poly[i][1]);
            xj = Number(poly[j][0]);
            yj = Number(poly[j][1]);
            if(IsPointOnSegment(pt,[xi,yi],[xj,yj]))
            {
               return true;
            }
            j = i++;
         }
         return false;
      }
      
      public static function IsPointOnSegment(p:Array, a:Array, b:Array) : Boolean
      {
         var cross:Number = (b[0] - a[0]) * (p[1] - a[1]) - (b[1] - a[1]) * (p[0] - a[0]);
         if(Math.abs(cross) > 1e-8)
         {
            return false;
         }
         var dot:Number = (p[0] - a[0]) * (b[0] - a[0]) + (p[1] - a[1]) * (b[1] - a[1]);
         if(dot < 0)
         {
            return false;
         }
         var lenSq:Number = (b[0] - a[0]) * (b[0] - a[0]) + (b[1] - a[1]) * (b[1] - a[1]);
         if(dot > lenSq)
         {
            return false;
         }
         return true;
      }
      
      public static function PointInPolygon(pt:Object, poly:Array) : Boolean
      {
         var xi:Number = NaN;
         var yi:Number = NaN;
         var xj:Number = NaN;
         var yj:Number = NaN;
         var inside:Boolean = false;
         var i:* = 0;
         var j:int = poly.length - 1;
         while(i < poly.length)
         {
            xi = Number(poly[i][0]);
            yi = Number(poly[i][1]);
            xj = Number(poly[j][0]);
            yj = Number(poly[j][1]);
            if(yi > pt[1] != yj > pt[1] && pt[0] < (xj - xi) * (pt[1] - yi) / (yj - yi) + xi)
            {
               inside = !inside;
            }
            j = i++;
         }
         return inside;
      }
   }
}

