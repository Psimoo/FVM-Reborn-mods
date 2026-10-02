package com.aurora.ui.maogoutd.component.Grid9
{
   import a_4794.a_4669;
   import a_4794.a_4670;
   import flash.display.BitmapData;
   import flash.utils.Dictionary;
   import flash.utils.getDefinitionByName;
   
   public class a_3261
   {
      
      private static var skin:Dictionary;
      
      public function a_3261()
      {
         super();
      }
      
      public static function create(id:String = "default-skin", dire:int = 1, TLName:String = null, TCName:String = null, TRName:String = null, CLName:String = null, CCName:String = null, CRName:String = null, BLName:String = null, BCName:String = null, BRName:String = null) : a_4669
      {
         if(skin == null)
         {
            skin = new Dictionary(true);
         }
         if(TLName == null || TCName == null || TRName == null || CLName == null || CCName == null || CRName == null || BLName == null || BCName == null || BRName == null)
         {
            id = "default-skin";
            TLName = "com.aurora.ui.maogoutd.component.Grid9.TL";
            TCName = "com.aurora.ui.maogoutd.component.Grid9.TC";
            TRName = "com.aurora.ui.maogoutd.component.Grid9.TR";
            CLName = "com.aurora.ui.maogoutd.component.Grid9.CL";
            CCName = "com.aurora.ui.maogoutd.component.Grid9.CC";
            CRName = "com.aurora.ui.maogoutd.component.Grid9.CR";
            BLName = "com.aurora.ui.maogoutd.component.Grid9.BL";
            BCName = "com.aurora.ui.maogoutd.component.Grid9.BC";
            BRName = "com.aurora.ui.maogoutd.component.Grid9.BR";
         }
         if(skin[id] == null)
         {
            skin[id] = getSkin(TLName,TCName,TRName,CLName,CCName,CRName,BLName,BCName,BRName);
         }
         return new a_4669(getData(skin[id]),dire);
      }
      
      private static function getSkin(TLName:String = null, TCName:String = null, TRName:String = null, CLName:String = null, CCName:String = null, CRName:String = null, BLName:String = null, BCName:String = null, BRName:String = null) : Dictionary
      {
         var skin:Dictionary = new Dictionary(true);
         skin.tl = getInstance(TLName);
         skin.tc = getInstance(TCName);
         skin.tr = getInstance(TRName);
         skin.cl = getInstance(CLName);
         skin.cc = getInstance(CCName);
         skin.cr = getInstance(CRName);
         skin.bl = getInstance(BLName);
         skin.bc = getInstance(BCName);
         skin.br = getInstance(BRName);
         return skin;
      }
      
      private static function getData(skin:Dictionary) : a_4670
      {
         return new a_4670(skin.tl,skin.tc,skin.tr,skin.cl,skin.cc,skin.cr,skin.bl,skin.bc,skin.br);
      }
      
      private static function getInstance(className:String) : BitmapData
      {
         var bmd:BitmapData = null;
         var RefClass:Object = getDefinitionByName(className);
         var obj:* = new RefClass();
         if(!(obj is BitmapData))
         {
            bmd = new BitmapData(obj.width,obj.height,true,16777215);
            obj = bmd.draw(obj);
         }
         return obj as BitmapData;
      }
   }
}

