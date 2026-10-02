package com.aurora.ui.maogoutd.task
{
   import a_4767.b_176;
   
   public class a_4524 implements ITaskServer
   {
      
      private var a_1206:b_176;
      
      public function a_4524()
      {
         super();
      }
      
      public function a_4497(taskID:int, byType:int = 0) : void
      {
         this.a_1206.a_2502(taskID,byType);
      }
      
      public function a_4498(task:a_4517) : void
      {
         this.a_1206.a_2504(task);
      }
      
      public function a_4499(achievementID:int) : void
      {
         this.a_1206.a_2515(achievementID);
      }
      
      public function a_4500(achievementInfo:a_4517) : void
      {
         this.a_1206.a_2516(achievementInfo);
      }
      
      public function setLobbyLogic(lobbyLogic:b_176) : void
      {
         this.a_1206 = lobbyLogic;
      }
   }
}

