package com.aurora.ui.maogoutd.mouse
{
   import a_4714.AssetType;
   import a_4714.AssetsItemData;
   import a_4714.AssetsLoader;
   import a_4754.a_1825;
   import a_4797.a_4687;
   import a_4797.a_4688;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class a_3855 extends Sprite
   {
      
      private static var instance:a_3855;
      
      private static var sign:Boolean = false;
      
      private var player:a_4688;
      
      public function a_3855()
      {
         super();
         if(!sign)
         {
            throw new Error("请通过静态方法getInstance()直接获取MouseManager引用！");
         }
         this.player = new a_4688();
      }
      
      public static function getInstance() : a_3855
      {
         if(instance == null)
         {
            sign = true;
            instance = new a_3855();
            sign = false;
         }
         return instance;
      }
      
      public function addMouses(mouseObjs:Array) : void
      {
         var mouseObj:a_4687 = null;
         var loadIDS:Array = new Array();
         var i:int = 0;
         var len:int = int(mouseObjs.length);
         while(i < len)
         {
            mouseObj = mouseObjs[i];
            if(this.player.getMCObj(mouseObj.id) == null)
            {
               if(mouseObj.mc == null)
               {
                  loadIDS.push(mouseObj.id);
               }
               this.player.addMCObj(mouseObj);
            }
            i++;
         }
         if(loadIDS.length > 0)
         {
            this.loadMouses(loadIDS);
         }
      }
      
      public function removeMouses(ids:Array) : Array
      {
         var mouseObj:a_4687 = null;
         var a:Array = new Array();
         var i:int = 0;
         var len:int = int(ids.length);
         while(i < len)
         {
            mouseObj = this.player.removeMCObj(ids[i]);
            if(mouseObj != null)
            {
               mouseObj.removeEventListener(a_3854.OVER_MOUSE,this.mouseObjOnMouseOver);
               mouseObj.removeEventListener(a_3854.OUT_MOUSE,this.mouseObjOnMouseOut);
               mouseObj.destroy();
            }
            a.push(mouseObj);
            i++;
         }
         return a;
      }
      
      public function setMousesState(ids:Array, states:Array) : void
      {
         var state:int = 0;
         var lastStateID:int = states.length - 1;
         var i:int = 0;
         var len:int = int(ids.length);
         while(i < len)
         {
            state = i > lastStateID ? int(states[lastStateID]) : int(states[i]);
            this.player.setMCObjState(ids[i],state);
            i++;
         }
      }
      
      public function setMousesPosition(ids:Array, psts:Array) : Array
      {
         var pst:String = null;
         var mcObj:a_4687 = null;
         var ra:Array = new Array();
         var lastStateID:int = psts.length - 1;
         var i:int = 0;
         var len:int = int(ids.length);
         while(i < len)
         {
            pst = i > lastStateID ? psts[lastStateID] : psts[i];
            mcObj = this.player.getMCObj(ids[i]);
            if(mcObj != null)
            {
               mcObj.setMCPosition(pst);
               ra.push(mcObj);
            }
            i++;
         }
         return ra;
      }
      
      public function sortMouse(ids:Array) : void
      {
         var mcObj:a_4687 = null;
         var mcObjs:Array = new Array();
         var i:int = 0;
         var len:int = int(ids.length);
         while(i < len)
         {
            mcObj = this.player.getMCObj(ids[i]);
            if(mcObj != null)
            {
               if(mcObj.parent == this)
               {
                  mcObjs.push(mcObj);
               }
            }
            i++;
         }
         this.sortMCObjs(mcObjs);
      }
      
      public function showMouses(ids:Array, b:Boolean = true) : Array
      {
         var prevMCObj:a_4687 = null;
         var mcObj:a_4687 = null;
         var pst:Point = null;
         var ra:Array = new Array();
         if(b)
         {
            while(this.numChildren > 0)
            {
               prevMCObj = this.removeChildAt(0) as a_4687;
               prevMCObj.removeEventListener(a_3854.OVER_MOUSE,this.mouseObjOnMouseOver);
               prevMCObj.removeEventListener(a_3854.OUT_MOUSE,this.mouseObjOnMouseOut);
            }
         }
         var i:int = 0;
         var len:int = int(ids.length);
         while(i < len)
         {
            mcObj = this.player.getMCObj(ids[i]);
            if(mcObj != null)
            {
               pst = mcObj.getMCPosition();
               if(!b)
               {
                  if(mcObj.parent == this)
                  {
                     removeChild(mcObj);
                     mcObj.removeEventListener(a_3854.OVER_MOUSE,this.mouseObjOnMouseOver);
                     mcObj.removeEventListener(a_3854.OUT_MOUSE,this.mouseObjOnMouseOut);
                  }
               }
               else
               {
                  if("0x0013" == mcObj.id || "0x0022" == mcObj.id || "0x0027" == mcObj.id || "0x010b" == mcObj.id || "0x0106" == mcObj.id || "0x0171" == mcObj.id || "0x0172" == mcObj.id || "0x0181" == mcObj.id || "0x0182" == mcObj.id || "0x0071" == mcObj.id || "0x0072" == mcObj.id || "0x0073" == mcObj.id || "0x0081" == mcObj.id || "0x0082" == mcObj.id || "0x0083" == mcObj.id || "0x0074" == mcObj.id || "0x0084" == mcObj.id || "0x0075" == mcObj.id || "0x0085" == mcObj.id || "0x0077" == mcObj.id || "0x0087" == mcObj.id || "0x0078" == mcObj.id || "0x0088" == mcObj.id || "0x0051" == mcObj.id || "0x0052" == mcObj.id || "0x0053" == mcObj.id || "0x0054" == mcObj.id || "0x0055" == mcObj.id || "0x0056" == mcObj.id)
                  {
                     mcObj.scaleX = mcObj.scaleY = 0.6;
                  }
                  else
                  {
                     mcObj.scaleX = mcObj.scaleY = 0.8;
                  }
                  if(mcObj.parent != this)
                  {
                     mcObj.x = pst.x;
                     mcObj.y = pst.y;
                     addChild(mcObj);
                     mcObj.addEventListener(a_3854.OVER_MOUSE,this.mouseObjOnMouseOver);
                     mcObj.addEventListener(a_3854.OUT_MOUSE,this.mouseObjOnMouseOut);
                  }
               }
               ra.push(mcObj);
            }
            i++;
         }
         if(b)
         {
            this.sortMCObjs(ra);
         }
         return ra;
      }
      
      public function set frameRate(fr:int) : void
      {
         this.player.frameRate = fr;
      }
      
      private function loadMouses(mouseIDS:Array) : void
      {
         var id:String = null;
         var assetsLoader:AssetsLoader = new AssetsLoader();
         var dict:Dictionary = new Dictionary(true);
         var i:int = 0;
         var len:int = int(mouseIDS.length);
         while(i < len)
         {
            id = mouseIDS[i];
            dict[id] = this.getAssetsItemData(id);
            i++;
         }
         assetsLoader.load(dict,{"onComplete":this.onLoadComplete},1);
      }
      
      private function onLoadComplete(dictMouse:Dictionary) : void
      {
         var k:String = null;
         var mcObj:a_4687 = null;
         for(k in dictMouse)
         {
            if(dictMouse[k] != null)
            {
               if(!(dictMouse[k] is Boolean))
               {
                  mcObj = this.player.getMCObj(k);
                  if(mcObj != null && dictMouse[k].data != null)
                  {
                     mcObj.mc = dictMouse[k].data.m;
                  }
               }
            }
         }
      }
      
      private function getAssetsItemData(id:String) : AssetsItemData
      {
         var url:String = null;
         var mcObj:a_4687 = this.player.getMCObj(id);
         if(mcObj != null)
         {
            url = mcObj.getURL();
         }
         if(url == null)
         {
            url = "resource/mouse/" + id + ".swf";
         }
         return new AssetsItemData(url,AssetType.SWF,id);
      }
      
      private function mouseObjOnMouseOver(a_4730:a_3854) : void
      {
         if(String(a_4730.target.id).indexOf("#") == 0)
         {
            return;
         }
         var point:Point = this.localToGlobal(new Point(a_4730.target.x + a_4730.target.width / 2,a_4730.target.y + a_4730.target.height / 2));
         a_1825.e.onShowMouseTip({
            "m_id":a_4730.target.id,
            "m_x":point.x,
            "m_y":point.y,
            "m_w":a_4730.target.width,
            "m_h":a_4730.target.height
         });
      }
      
      private function mouseObjOnMouseOut(a_4730:a_3854) : void
      {
         if(String(a_4730.target.id).indexOf("#") == 0)
         {
            return;
         }
         a_1825.e.onHideMouseTip();
      }
      
      private function sortMCObjs(p_arrMCObjs:Array) : void
      {
         var i:int = 0;
         var len:int = 0;
         if(p_arrMCObjs.length > 0)
         {
            p_arrMCObjs.sortOn(["x","y"],[Array.NUMERIC,Array.NUMERIC]);
            i = 0;
            len = int(p_arrMCObjs.length);
            while(i < len)
            {
               setChildIndex(p_arrMCObjs[i],i);
               i++;
            }
         }
      }
   }
}

