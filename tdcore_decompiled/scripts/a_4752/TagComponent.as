package a_4752
{
   import flash.utils.Dictionary;
   
   public class TagComponent
   {
      
      private var _tagDict:Dictionary = new Dictionary();
      
      private var _sumDict:Dictionary = new Dictionary();
      
      public function TagComponent()
      {
         super();
      }
      
      public function AddTag(iTag:int) : Boolean
      {
         if(this._tagDict[iTag] == null)
         {
            this._tagDict[iTag] = 1;
            return true;
         }
         return false;
      }
      
      public function RemoveTag(iTag:int) : Boolean
      {
         if(this._tagDict[iTag] != null)
         {
            delete this._tagDict[iTag];
            return true;
         }
         return false;
      }
      
      public function HasTag(iTag:int) : Boolean
      {
         return this._tagDict[iTag] != null || this._tagDict[iTag + 10000000] != null;
      }
      
      public function ClearAll() : void
      {
         this._tagDict = new Dictionary();
         this._sumDict = new Dictionary();
      }
      
      public function AddSum(key:String) : void
      {
         if(this._sumDict[key] == null)
         {
            this._sumDict[key] = 0;
         }
         this._sumDict[key] += 1;
      }
      
      public function RemoveSum(key:String) : void
      {
         if(this._sumDict[key] == null)
         {
            return;
         }
         this._sumDict[key] = this._sumDict[key] - 1;
         if(this._sumDict[key] <= 0)
         {
            this.DeleteSum(key);
         }
      }
      
      public function DeleteSum(key:String) : void
      {
         if(this._sumDict[key] != null)
         {
            delete this._sumDict[key];
         }
      }
      
      public function GetSum(key:String) : int
      {
         if(this._sumDict[key] == null)
         {
            return 0;
         }
         if(this._sumDict[key] > 0)
         {
            return this._sumDict[key];
         }
         return 0;
      }
      
      public function HasSum(key:String) : Boolean
      {
         return this.GetSum(key) > 0;
      }
   }
}

