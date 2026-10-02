package a_4783
{
   import a_4778.ProgressEvent;
   import flash.events.Event;
   import flash.net.FileReference;
   import flash.net.URLRequest;
   
   public class a_4643
   {
      
      private var fr:FileReference;
      
      private var a_1718:String;
      
      public function a_4643()
      {
         super();
      }
      
      public function init(url:String) : void
      {
         this.a_1718 = url;
         if(this.fr == null)
         {
            this.fr = new FileReference();
            this.fr.addEventListener(Event.OPEN,this.openHandler);
            this.fr.addEventListener(ProgressEvent.PROGRESS,this.progressHandler);
            this.fr.addEventListener(Event.COMPLETE,this.completeHandler);
         }
      }
      
      private function openHandler(a_4730:Event) : void
      {
      }
      
      public function startDownload(defaultFileName:String = null) : void
      {
         var request:URLRequest = new URLRequest();
         request.url = this.a_1718;
         this.fr.download(request,defaultFileName);
      }
      
      private function progressHandler(a_4730:ProgressEvent) : void
      {
      }
      
      private function completeHandler(a_4730:Event) : void
      {
      }
   }
}

