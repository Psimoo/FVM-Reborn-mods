package a_4797
{
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class a_4688
   {
      
      private var mcObjs:Vector.<a_4687>;
      
      private var timer:Timer;
      
      private var _frameRate:int = 12;
      
      public function a_4688()
      {
         super();
         this.init();
      }
      
      public function set frameRate(v:int) : void
      {
         this._frameRate = v;
         if(this.timer != null)
         {
            if(this.timer.delay != int(1000 / this._frameRate))
            {
               this.timer.delay = int(1000 / this._frameRate);
            }
         }
      }
      
      public function addMCObj(mcObj:a_4687) : Boolean
      {
         if(this.searchById(mcObj.id) == -1)
         {
            this.mcObjs.push(mcObj);
            return true;
         }
         return false;
      }
      
      public function removeMCObj(pId:String) : a_4687
      {
         var id:int = this.searchById(pId);
         if(id > -1)
         {
            return this.mcObjs.splice(id,1) as a_4687;
         }
         return null;
      }
      
      public function setMCObjState(pId:String, state:int) : Boolean
      {
         var id:int = this.searchById(pId);
         if(id > -1)
         {
            this.mcObjs[id].state = state;
            return true;
         }
         return false;
      }
      
      public function getMCObj(pId:String) : a_4687
      {
         var id:int = this.searchById(pId);
         if(id > -1)
         {
            return this.mcObjs[id];
         }
         return null;
      }
      
      private function init() : void
      {
         this.mcObjs = new Vector.<a_4687>();
         this.timer = new Timer(int(1000 / this._frameRate));
         this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
         this.timer.start();
      }
      
      private function onTimer(a_4730:TimerEvent) : void
      {
         if(this.mcObjs.length == 0)
         {
            return;
         }
         this.mcObjs.forEach(this.playing);
      }
      
      private function playing(item:a_4687, index:int, vector:Vector.<a_4687>) : void
      {
         if(item.parent != null)
         {
            if(item.state == a_4685.PLAY)
            {
               if(item.currentFrame == item.totalFrames)
               {
                  item.gotoAndStop(1);
               }
               else
               {
                  item.nextFrame();
               }
            }
         }
      }
      
      private function searchById(id:String) : int
      {
         if(this.mcObjs.length == 0)
         {
            return -1;
         }
         var i:int = 0;
         var len:int = int(this.mcObjs.length);
         while(i < len)
         {
            if(this.mcObjs[i].id == id)
            {
               return i;
            }
            i++;
         }
         return -1;
      }
   }
}

