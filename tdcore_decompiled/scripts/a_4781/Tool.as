package a_4781
{
   import fl.motion.AdjustColor;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.InteractiveObject;
   import flash.filters.ColorMatrixFilter;
   import flash.net.getClassByAlias;
   import flash.net.registerClassAlias;
   import flash.utils.ByteArray;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   public class Tool
   {
      
      public static var MAX_INT:int = Math.pow(2,31) - 1;
      
      public function Tool()
      {
         super();
      }
      
      public static function a_4653(obj:*) : *
      {
         var aliasClass:Class = null;
         var classDefinition:Class = Object(obj).constructor as Class;
         var className:String = getQualifiedClassName(obj);
         try
         {
            aliasClass = getClassByAlias(className);
         }
         catch(err:Error)
         {
         }
         if(!aliasClass)
         {
            registerClassAlias(className,classDefinition);
         }
         else if(aliasClass != classDefinition)
         {
            registerClassAlias(className + ":/:" + className,classDefinition);
         }
         var byteArray:ByteArray = new ByteArray();
         byteArray.writeObject(obj);
         byteArray.position = 0;
         return byteArray.readObject();
      }
      
      public static function getClassByName(className:String) : Class
      {
         try
         {
            return getDefinitionByName(className) as Class;
         }
         catch(e:ReferenceError)
         {
            try
            {
               return getClassByAlias(className);
            }
            catch(e2:ReferenceError)
            {
               trace("Class Not exist:<" + className + ">.");
               return null;
            }
         }
      }
      
      public static function getColorMatrix(brightness:Number = 0, contrast:Number = 0, hue:Number = 0, saturation:Number = 0) : Array
      {
         var ac:AdjustColor = new AdjustColor();
         ac.brightness = brightness;
         ac.contrast = contrast;
         ac.hue = hue;
         ac.saturation = saturation;
         return ac.CalculateFinalFlatArray();
      }
      
      public static function setEnabled(target:InteractiveObject, disabled:DisplayObject, ct:DisplayObjectContainer, enabled:Boolean) : void
      {
         var index:int = 0;
         if(ct == null)
         {
            throw new Error("提供的容器对象不能为null!");
         }
         if(enabled)
         {
            if(disabled == null)
            {
               target.filters = [new ColorMatrixFilter(getColorMatrix())];
               target.mouseEnabled = true;
            }
            else if(disabled.parent == ct)
            {
               index = ct.getChildIndex(disabled);
               ct.removeChild(disabled);
               if(target.parent != ct)
               {
                  ct.addChildAt(target,index);
               }
            }
            else if(target.parent != ct)
            {
               ct.addChild(target);
            }
         }
         else if(disabled == null)
         {
            target.filters = [new ColorMatrixFilter(getColorMatrix(0,0,0,-100))];
            target.mouseEnabled = false;
         }
         else if(target.parent == ct)
         {
            index = ct.getChildIndex(target);
            ct.removeChild(target);
            if(disabled.parent != ct)
            {
               ct.addChildAt(disabled,index);
            }
         }
         else if(disabled.parent != ct)
         {
            ct.addChild(disabled);
         }
      }
      
      public static function timeFormat(t:int = 0, type:String = "00:00:00") : String
      {
         var m:int = int(t / (60 * 1000));
         var s:int = Math.round((t - m * 60 * 1000) / 1000);
         if(s == 60)
         {
            s = 0;
            m += 1;
         }
         if(type == "00:00")
         {
            return num2str(m,2) + ":" + num2str(s,2);
         }
         var h:int = Math.floor(m / 60);
         m -= h * 60;
         if(m == 60)
         {
            m = 0;
            h += 1;
         }
         return num2str(h,2) + ":" + num2str(m,2) + ":" + num2str(s,2);
      }
      
      public static function num2str(num:int, len:int) : String
      {
         var strNum:String = num.toString();
         while(strNum.length < len)
         {
            strNum = "0" + strNum;
         }
         return strNum;
      }
      
      public static function getInequalityRanNums(num:uint = 1, maxValue:uint = 4294967295, usedNums:Array = null) : Array
      {
         var temp:uint = 0;
         if(null == usedNums)
         {
            usedNums = [];
         }
         if(maxValue < 1)
         {
            usedNums[0] = 0;
         }
         else
         {
            while(num > 0)
            {
               temp = Math.round(Math.random() * maxValue);
               if(usedNums.indexOf(temp) == -1)
               {
                  usedNums.push(temp);
                  num--;
               }
            }
         }
         return usedNums;
      }
   }
}

