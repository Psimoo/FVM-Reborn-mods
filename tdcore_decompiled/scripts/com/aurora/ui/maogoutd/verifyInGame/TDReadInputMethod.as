package com.aurora.ui.maogoutd.verifyInGame
{
   public class TDReadInputMethod
   {
      
      public function TDReadInputMethod()
      {
         super();
      }
      
      public function getMethodList() : Array
      {
         return [TDReadInputVerify.METHOD_TYPE_100,TDReadInputVerify.METHOD_TYPE_101,TDReadInputVerify.METHOD_TYPE_102,TDReadInputVerify.METHOD_TYPE_103,TDReadInputVerify.METHOD_TYPE_104,TDReadInputVerify.METHOD_TYPE_105,TDReadInputVerify.METHOD_TYPE_106,TDReadInputVerify.METHOD_TYPE_200,TDReadInputVerify.METHOD_TYPE_201,TDReadInputVerify.METHOD_TYPE_202,TDReadInputVerify.METHOD_TYPE_300,TDReadInputVerify.METHOD_TYPE_301,TDReadInputVerify.METHOD_TYPE_400,TDReadInputVerify.METHOD_TYPE_401,TDReadInputVerify.METHOD_TYPE_402];
      }
      
      public function getRandMethodID() : int
      {
         var list:Array = this.getMethodList();
         var rand:int = Math.random() * list.length;
         return list[rand];
      }
   }
}

