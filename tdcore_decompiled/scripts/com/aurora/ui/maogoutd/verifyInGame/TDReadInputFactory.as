package com.aurora.ui.maogoutd.verifyInGame
{
   import com.aurora.ui.maogoutd.verifyInGame.view.BaseChicken;
   import com.aurora.ui.maogoutd.verifyInGame.view.BaseCubDog;
   import com.aurora.ui.maogoutd.verifyInGame.view.BaseDog;
   import com.aurora.ui.maogoutd.verifyInGame.view.BaseHorse;
   import com.aurora.ui.maogoutd.verifyInGame.view.BasePig;
   import com.aurora.ui.maogoutd.verifyInGame.view.BaseSkyHorse;
   import com.aurora.ui.maogoutd.verifyInGame.view.BaseSnake;
   import com.aurora.ui.maogoutd.verifyInGame.view.BaseSuperSnake;
   import com.aurora.ui.maogoutd.verifyInGame.view.BaseTiger;
   import com.aurora.ui.maogoutd.verifyInGame.view.FirstChicken;
   import com.aurora.ui.maogoutd.verifyInGame.view.FirstCubDog;
   import com.aurora.ui.maogoutd.verifyInGame.view.FirstDog;
   import com.aurora.ui.maogoutd.verifyInGame.view.FirstHorse;
   import com.aurora.ui.maogoutd.verifyInGame.view.FirstPig;
   import com.aurora.ui.maogoutd.verifyInGame.view.FirstSkyHorse;
   import com.aurora.ui.maogoutd.verifyInGame.view.FirstSnake;
   import com.aurora.ui.maogoutd.verifyInGame.view.FirstSuperSnake;
   import com.aurora.ui.maogoutd.verifyInGame.view.FirstTiger;
   import com.aurora.ui.maogoutd.verifyInGame.view.IVerifyAni;
   import com.aurora.ui.maogoutd.verifyInGame.view.SecondChicken;
   import com.aurora.ui.maogoutd.verifyInGame.view.SecondCubDog;
   import com.aurora.ui.maogoutd.verifyInGame.view.SecondDog;
   import com.aurora.ui.maogoutd.verifyInGame.view.SecondHorse;
   import com.aurora.ui.maogoutd.verifyInGame.view.SecondPig;
   import com.aurora.ui.maogoutd.verifyInGame.view.SecondSkyHorse;
   import com.aurora.ui.maogoutd.verifyInGame.view.SecondSnake;
   import com.aurora.ui.maogoutd.verifyInGame.view.SecondSuperSnake;
   import com.aurora.ui.maogoutd.verifyInGame.view.SecondTiger;
   
   public class TDReadInputFactory
   {
      
      public function TDReadInputFactory()
      {
         super();
      }
      
      public function getResourceIds(type:int) : Array
      {
         var ids:Array = null;
         switch(type)
         {
            case TDReadInputVerify.TYPE_HORSE:
               ids = [0,1,2,3,4,5];
               break;
            case TDReadInputVerify.TYPE_DOG:
               ids = [6,7,8,9,10,11];
               break;
            case TDReadInputVerify.TYPE_SNAKE:
               ids = [12,13,14,15,16,17];
               break;
            case TDReadInputVerify.TYPE_PIG:
               ids = [18,19,20];
               break;
            case TDReadInputVerify.TYPE_CHICKEN:
               ids = [21,22,23];
               break;
            case TDReadInputVerify.TYPE_TIGER:
               ids = [24,25,26];
         }
         return ids;
      }
      
      public function getResourceId(type:int) : int
      {
         var ids:Array = this.getResourceIds(type);
         var random:int = Math.random() * ids.length;
         return ids[random];
      }
      
      public function getAnimationResource(aniId:int) : IVerifyAni
      {
         var target:IVerifyAni = null;
         switch(aniId)
         {
            case 0:
               target = new BaseHorse();
               target.setType(TDReadInputVerify.TYPE_HORSE);
               break;
            case 1:
               target = new FirstHorse();
               target.setType(TDReadInputVerify.TYPE_HORSE);
               break;
            case 2:
               target = new SecondHorse();
               target.setType(TDReadInputVerify.TYPE_HORSE);
               break;
            case 3:
               target = new BaseSkyHorse();
               target.setType(TDReadInputVerify.TYPE_HORSE);
               break;
            case 4:
               target = new FirstSkyHorse();
               target.setType(TDReadInputVerify.TYPE_HORSE);
               break;
            case 5:
               target = new SecondSkyHorse();
               target.setType(TDReadInputVerify.TYPE_HORSE);
               break;
            case 6:
               target = new BaseDog();
               target.setType(TDReadInputVerify.TYPE_DOG);
               break;
            case 7:
               target = new FirstDog();
               target.setType(TDReadInputVerify.TYPE_DOG);
               break;
            case 8:
               target = new SecondDog();
               target.setType(TDReadInputVerify.TYPE_DOG);
               break;
            case 9:
               target = new BaseCubDog();
               target.setType(TDReadInputVerify.TYPE_DOG);
               break;
            case 10:
               target = new FirstCubDog();
               target.setType(TDReadInputVerify.TYPE_DOG);
               break;
            case 11:
               target = new SecondCubDog();
               target.setType(TDReadInputVerify.TYPE_DOG);
               break;
            case 12:
               target = new BaseSnake();
               target.setType(TDReadInputVerify.TYPE_SNAKE);
               break;
            case 13:
               target = new FirstSnake();
               target.setType(TDReadInputVerify.TYPE_SNAKE);
               break;
            case 14:
               target = new SecondSnake();
               target.setType(TDReadInputVerify.TYPE_SNAKE);
               break;
            case 15:
               target = new BaseSuperSnake();
               target.setType(TDReadInputVerify.TYPE_SNAKE);
               break;
            case 16:
               target = new FirstSuperSnake();
               target.setType(TDReadInputVerify.TYPE_SNAKE);
               break;
            case 17:
               target = new SecondSuperSnake();
               target.setType(TDReadInputVerify.TYPE_SNAKE);
               break;
            case 18:
               target = new BasePig();
               target.setType(TDReadInputVerify.TYPE_PIG);
               break;
            case 19:
               target = new FirstPig();
               target.setType(TDReadInputVerify.TYPE_PIG);
               break;
            case 20:
               target = new SecondPig();
               target.setType(TDReadInputVerify.TYPE_PIG);
               break;
            case 21:
               target = new BaseChicken();
               target.setType(TDReadInputVerify.TYPE_CHICKEN);
               break;
            case 22:
               target = new FirstChicken();
               target.setType(TDReadInputVerify.TYPE_CHICKEN);
               break;
            case 23:
               target = new SecondChicken();
               target.setType(TDReadInputVerify.TYPE_CHICKEN);
               break;
            case 24:
               target = new BaseTiger();
               target.setType(TDReadInputVerify.TYPE_TIGER);
               break;
            case 25:
               target = new FirstTiger();
               target.setType(TDReadInputVerify.TYPE_TIGER);
               break;
            case 26:
               target = new SecondTiger();
               target.setType(TDReadInputVerify.TYPE_TIGER);
               break;
            default:
               target = new BaseHorse();
               target.setType(TDReadInputVerify.TYPE_HORSE);
         }
         return target;
      }
   }
}

