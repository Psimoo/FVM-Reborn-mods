package a_4763
{
   import a_4716.a_1731;
   import a_4765.a_2333;
   import a_4789.IModulesBridge;
   import a_4789.a_4657;
   import flash.utils.Dictionary;
   
   public class a_2608 implements IPlayersCommonData
   {
      
      private static var _instance:IPlayersCommonData;
      
      private static var sign:Boolean;
      
      private const MAX_REQUEST:int = 32;
      
      private var dictData:Dictionary;
      
      private var arrTemp:Array;
      
      private var arrResponseTemp:Array;
      
      private var iResponseNum:int = 0;
      
      private var mBridge:IModulesBridge;
      
      public function a_2608()
      {
         super();
         if(!sign)
         {
            throw new Error("PlayersCommonData不允许实例化，请通过getInstance()获取！");
         }
         this.mBridge = a_4657.getInstance();
         this.mBridge.addListener(this,true);
         this.dictData = new Dictionary();
         this.arrTemp = [];
         this.arrResponseTemp = [];
      }
      
      public static function getInstance() : IPlayersCommonData
      {
         if(_instance == null)
         {
            sign = true;
            _instance = new a_2608();
            sign = false;
         }
         return _instance;
      }
      
      public function setPlayerCommonData(iUin:int, objData:Object) : void
      {
         var k:* = undefined;
         var dict:Dictionary = null;
         var i:int = 0;
         var n:int = 0;
         var uin:int = 0;
         var id:int = 0;
         if(!objData)
         {
            return;
         }
         var obj:Object = this.dictData[iUin];
         if(!obj)
         {
            obj = {};
            this.dictData[iUin] = obj;
         }
         this.arrResponseTemp.push(iUin);
         for(k in objData)
         {
            obj[k] = objData[k];
         }
         if(this.arrTemp.length > 0)
         {
            if(this.arrTemp.indexOf(iUin) > -1)
            {
               --this.iResponseNum;
            }
         }
         if(this.iResponseNum <= 0)
         {
            dict = new Dictionary();
            i = 0;
            n = int(this.arrResponseTemp.length);
            while(i < n)
            {
               uin = int(this.arrResponseTemp[i]);
               id = this.arrTemp.indexOf(uin);
               if(id > -1)
               {
                  this.arrTemp.splice(id,1);
               }
               dict[uin] = this.dictData[uin];
               i++;
            }
            this.mBridge.execute("onSetPlayersCommonData",this,dict);
            if(this.arrTemp.length > 0)
            {
               this.requestData();
            }
         }
      }
      
      public function getAllPlayersCommonData() : Dictionary
      {
         return this.dictData;
      }
      
      public function getPlayersCommonData(arrUin:Array) : void
      {
         var uin:int = 0;
         var obj:Object = null;
         if(!arrUin || arrUin.length == 0)
         {
            return;
         }
         var dict:Dictionary = new Dictionary();
         var flag:Boolean = this.arrTemp.length == 0;
         var i:int = 0;
         var n:int = int(arrUin.length);
         while(i < n)
         {
            uin = int(arrUin[i]);
            obj = this.dictData[uin];
            if(!obj)
            {
               this.arrTemp.push(arrUin[i]);
            }
            else
            {
               dict[uin] = obj;
            }
            i++;
         }
         if(flag)
         {
            this.requestData();
         }
         this.mBridge.execute("onSetPlayersCommonData",this,dict);
      }
      
      private function requestData() : void
      {
         this.iResponseNum = Math.min(this.MAX_REQUEST,this.arrTemp.length);
         this.arrResponseTemp.splice(0);
         var arr:Array = [];
         for(var i:int = 0; i < this.iResponseNum; i++)
         {
            arr[i] = this.arrTemp[i];
         }
         a_2333.getInstance().a_2309(arr,a_1731.a_340 | a_1731.FLAG_GAME | a_1731.FLAG_VIP);
         a_2333.getInstance().a_2310(arr);
      }
      
      public function ClearAllPlayersCommonData() : void
      {
         this.dictData = new Dictionary();
      }
   }
}

