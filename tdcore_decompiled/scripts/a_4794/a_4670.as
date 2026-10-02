package a_4794
{
   import flash.display.IBitmapDrawable;
   
   public class a_4670
   {
      
      private var _tl:IBitmapDrawable = null;
      
      private var _tc:IBitmapDrawable = null;
      
      private var _tr:IBitmapDrawable = null;
      
      private var _cl:IBitmapDrawable = null;
      
      private var _cc:IBitmapDrawable = null;
      
      private var _cr:IBitmapDrawable = null;
      
      private var _bl:IBitmapDrawable = null;
      
      private var _bc:IBitmapDrawable = null;
      
      private var _br:IBitmapDrawable = null;
      
      public function a_4670(tl:IBitmapDrawable, tc:IBitmapDrawable, tr:IBitmapDrawable, cl:IBitmapDrawable, cc:IBitmapDrawable, cr:IBitmapDrawable, bl:IBitmapDrawable, bc:IBitmapDrawable, br:IBitmapDrawable)
      {
         super();
         if(!tl || !tc || !tr || !cl || !cc || !cr || !bl || !bc || !br)
         {
            throw new Error("提供的Grid9ImageData数据中不能为null!");
         }
         this._tl = tl;
         this._tc = tc;
         this._tr = tr;
         this._cl = cl;
         this._cc = cc;
         this._cr = cr;
         this._bl = bl;
         this._bc = bc;
         this._br = br;
      }
      
      public function get tl() : IBitmapDrawable
      {
         return this._tl;
      }
      
      public function get tc() : IBitmapDrawable
      {
         return this._tc;
      }
      
      public function get tr() : IBitmapDrawable
      {
         return this._tr;
      }
      
      public function get cl() : IBitmapDrawable
      {
         return this._cl;
      }
      
      public function get cc() : IBitmapDrawable
      {
         return this._cc;
      }
      
      public function get cr() : IBitmapDrawable
      {
         return this._cr;
      }
      
      public function get bl() : IBitmapDrawable
      {
         return this._bl;
      }
      
      public function get bc() : IBitmapDrawable
      {
         return this._bc;
      }
      
      public function get br() : IBitmapDrawable
      {
         return this._br;
      }
   }
}

