package a_4795
{
   import a_4781.Tool;
   import a_4782.a_4638;
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   
   public class a_4676 extends EventDispatcher
   {
      
      private var _dp:Array;
      
      private var _list_dp:Array;
      
      private var _w:int;
      
      private var _h:int;
      
      public function a_4676()
      {
         super();
      }
      
      public static function getData(target:Array, startId:uint = 0, num:int = -1) : Array
      {
         var endId:uint = 0;
         if(target == null)
         {
            return null;
         }
         if(target.length == 0)
         {
            return [];
         }
         if(num == -1)
         {
            endId = target.length;
         }
         else
         {
            endId = startId + num;
            if(endId > target.length)
            {
               endId = target.length;
            }
         }
         var temp:Array = new Array();
         for(var i:uint = startId; i < endId; i++)
         {
            temp.push(target[i]);
         }
         return temp;
      }
      
      public static function getIndexesOnFlag(target:Array, flag:int) : Array
      {
         if(target == null || target.length == 0)
         {
            return null;
         }
         var len:uint = target.length;
         var temp:Array = new Array();
         for(var i:uint = 0; i < len; i++)
         {
            if(target[i].flag == flag)
            {
               temp.push(i);
            }
         }
         return temp;
      }
      
      public static function setFlags(target:Array, flags:Array) : Array
      {
         var id:int = 0;
         var len:uint = flags.length;
         var len1:uint = target.length;
         var temp:Array = new Array();
         for(var i:uint = 0; i < len; i++)
         {
            id = int(flags[i].index);
            if(id >= 0 && id < len1)
            {
               if(id >= 0 && id < target.length)
               {
                  target[id].flag = flags[i].flag;
                  temp.push(target[id]);
               }
            }
         }
         return temp;
      }
      
      public static function setItemsSize(target:Array, sizes:Array) : Array
      {
         var id:int = 0;
         var len:uint = sizes.length;
         var len1:uint = target.length;
         var temp:Array = new Array();
         for(var i:uint = 0; i < len; i++)
         {
            id = int(sizes[i].index);
            if(id >= 0 && id < len1)
            {
               if(id >= 0 && id < target.length)
               {
                  target[id].w = sizes[i].w;
                  target[id].h = sizes[i].h;
                  temp.push(target[id]);
               }
            }
         }
         return temp;
      }
      
      public static function deleteItems(target:Array, delTarget:Array) : Dictionary
      {
         if(delTarget.length == 0)
         {
            return new Dictionary();
         }
         delTarget.sort(sortOnIndex);
         var dict:Dictionary = new Dictionary(true);
         dict.flags = new Array();
         dict.newItems = new Array();
         var len:uint = target.length;
         for(var i:uint = 0; i < len; i++)
         {
            if(target.length > 0 && target[i] == delTarget[0])
            {
               dict.flags[delTarget.shift().flag] = dict.newItems.length;
            }
            else
            {
               dict.newItems.push(target[i]);
            }
         }
         return dict;
      }
      
      public static function insertItems(target:Array, insertTarget:Array, insertId:int, sign:Boolean = false) : Array
      {
         var checkId:uint = 0;
         var i:uint = 0;
         if(insertTarget.length == 0)
         {
            throw new Error("empty insert items error!");
         }
         insertTarget.sort(sortOnIndex);
         var newItems:Array = new Array();
         var len:uint = target.length;
         if(sign)
         {
            newItems = arrayCopy(target);
         }
         else
         {
            checkId = 0;
            for(i = 0; i < len; i++)
            {
               if(checkId < insertTarget.length && target[i] == insertTarget[checkId])
               {
                  checkId++;
               }
               else
               {
                  newItems.push(target[i]);
                  if(target[i].index == insertId)
                  {
                     insertId = newItems.length - 1;
                  }
               }
            }
         }
         checkId = 0;
         if(insertId >= newItems.length)
         {
            for(i = 0; i < insertTarget.length; i++)
            {
               newItems.push(insertTarget[i]);
            }
            insertId = -1;
         }
         while(checkId < newItems.length)
         {
            newItems[checkId].index = checkId;
            if(checkId == insertId)
            {
               for(i = 0; i < insertTarget.length; i++)
               {
                  newItems.splice(insertId,0,insertTarget[i]);
                  insertId++;
               }
               insertId = -201200;
            }
            else
            {
               checkId++;
            }
         }
         return newItems;
      }
      
      public static function arrayCopy(a:Array) : Array
      {
         return Tool.a_4653(a) as Array;
      }
      
      private static function sortOnIndex(a:*, b:*) : Number
      {
         if(a.index > b.index)
         {
            return 1;
         }
         if(a.index < b.index)
         {
            return -1;
         }
         return 0;
      }
      
      public function setSize(w:int, h:int) : void
      {
         this._w = w;
         this._h = h;
      }
      
      public function updateData(dp:Array) : void
      {
         var obj:Object = null;
         if(this._list_dp == null)
         {
            this._list_dp = new Array();
         }
         else
         {
            this._list_dp.splice(0);
         }
         var len:uint = dp.length;
         this._dp = dp;
         for(var i:uint = 0; i < len; i++)
         {
            obj = {};
            if(!this._dp[i].hasOwnProperty("w") || this._dp[i].w == undefined || isNaN(this._dp[i].w))
            {
               obj.w = this._w;
            }
            else
            {
               obj.w = this._dp[i].w;
            }
            if(!this._dp[i].hasOwnProperty("h") || this._dp[i].h == undefined || isNaN(this._dp[i].h))
            {
               obj.h = this._h;
            }
            else
            {
               obj.h = this._dp[i].h;
            }
            obj.index = i;
            if(!this._dp[i].hasOwnProperty("flag") || this._dp[i].flag == undefined)
            {
               obj.flag = 0;
            }
            else
            {
               obj.flag = this._dp[i].flag;
            }
            this._list_dp.push(obj);
         }
         dispatchEvent(new a_4638(a_4638.DATA_UPDATE));
      }
      
      public function getAllDataSize() : int
      {
         if(this._dp == null)
         {
            return 0;
         }
         return this._dp.length;
      }
      
      public function get dp() : Array
      {
         return this._dp;
      }
      
      public function get list_dp() : Array
      {
         return this._list_dp;
      }
   }
}

