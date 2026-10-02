package a_4794
{
   import flash.display.DisplayObject;
   
   public class a_4668
   {
      
      private var _part1:DisplayObject = null;
      
      private var _part2:DisplayObject = null;
      
      private var _part3:DisplayObject = null;
      
      private var _direction:int = 0;
      
      public function a_4668(p1:DisplayObject, p2:DisplayObject, p3:DisplayObject, dire:int = 0)
      {
         super();
         if(p1 == null || p2 == null || p3 == null)
         {
            throw new Error("参数不能为null!");
         }
         this._part1 = p1;
         this._part2 = p2;
         this._part3 = p3;
         this.direction = dire;
      }
      
      public function set part1(v:DisplayObject) : void
      {
         if(v == null)
         {
            throw new Error("参数不能为null!");
         }
         this._part1 = v;
      }
      
      public function get part1() : DisplayObject
      {
         return this._part1;
      }
      
      public function set part2(v:DisplayObject) : void
      {
         if(v == null)
         {
            throw new Error("参数不能为null!");
         }
         this._part2 = v;
      }
      
      public function get part2() : DisplayObject
      {
         return this._part2;
      }
      
      public function set part3(v:DisplayObject) : void
      {
         if(v == null)
         {
            throw new Error("参数不能为null!");
         }
         this._part3 = v;
      }
      
      public function get part3() : DisplayObject
      {
         return this._part3;
      }
      
      public function set direction(v:int) : void
      {
         if(v != 0 && v != 1)
         {
            v = 0;
         }
         this._direction = v;
      }
      
      public function get direction() : int
      {
         return this._direction;
      }
   }
}

