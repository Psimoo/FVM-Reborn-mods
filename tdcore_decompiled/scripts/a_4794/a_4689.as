package a_4794
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.utils.getDefinitionByName;
   
   public class a_4689 extends Sprite
   {
      
      private var _numsClass:Array;
      
      private var _num:int = -1;
      
      private var _numScaleX:Number = 1;
      
      private var _numScaleY:Number = 1;
      
      private var maxHeight:Number;
      
      public function a_4689(numsClass:Array)
      {
         super();
         if(numsClass != null && numsClass.length == 10)
         {
            this._numsClass = numsClass;
         }
      }
      
      public function clear() : void
      {
         while(numChildren > 0)
         {
            removeChildAt(0);
         }
         this._num = -1;
      }
      
      public function setScale(sx:Number, sy:Number) : void
      {
         this._numScaleX = sx;
         this._numScaleY = sy;
         this.adjust();
      }
      
      public function set numsClass(a:Array) : void
      {
         if(a == null || a.length != 10)
         {
            throw new Error("提供的数组必须包行10个数字的关联对象的名称！");
         }
         this._numsClass = a;
      }
      
      public function set num(strNum:String) : void
      {
         var NumClass:Object = null;
         var tempNum:* = undefined;
         strNum = this.checkNum(strNum);
         if(strNum.length == 0)
         {
            return;
         }
         if(this._num == Number(strNum))
         {
            return;
         }
         this.clear();
         this._num = Number(strNum);
         this.maxHeight = 0;
         var temp:Array = strNum.toString().split("");
         var i:int = 0;
         var len:int = int(temp.length);
         while(i < len)
         {
            NumClass = getDefinitionByName(this._numsClass[Number(temp[i])]);
            tempNum = new NumClass();
            if(tempNum is DisplayObject)
            {
               tempNum = new NumClass() as DisplayObject;
            }
            else
            {
               if(!(tempNum is BitmapData))
               {
                  throw new Error("提供的类型只能是DisplayObject,或者BitmapData及其子类！");
               }
               tempNum = new Bitmap(new NumClass() as BitmapData);
            }
            this.maxHeight = Math.max(this.maxHeight,tempNum.height);
            addChild(tempNum);
            i++;
         }
         this.adjust();
      }
      
      private function checkNum(strNum:String) : String
      {
         var reg:RegExp = /[^0-9]/ig;
         return strNum.replace(reg,"");
      }
      
      private function adjust() : void
      {
         var tempX:Number = NaN;
         var i:int = 0;
         var len:int = 0;
         var tempNum:DisplayObject = null;
         if(numChildren > 0)
         {
            tempX = 0;
            i = 0;
            len = numChildren;
            while(i < len)
            {
               tempNum = getChildAt(i);
               tempNum.scaleX = this._numScaleX;
               tempNum.scaleY = this._numScaleY;
               tempNum.y = this.maxHeight * this._numScaleY - tempNum.height;
               tempNum.x = tempX;
               tempX = tempNum.x + tempNum.width;
               i++;
            }
         }
      }
   }
}

