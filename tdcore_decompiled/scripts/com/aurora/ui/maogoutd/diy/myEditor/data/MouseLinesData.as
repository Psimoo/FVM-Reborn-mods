package com.aurora.ui.maogoutd.diy.myEditor.data
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.logicserver.diy.enmDIYWaveCodeVersion;
   import flash.utils.ByteArray;
   
   public class MouseLinesData
   {
      
      public var m_iChatBubblesID:int;
      
      public var m_iTalkingMouseID:int;
      
      public var m_strLinesContent:String;
      
      public var m_iShowTime:int;
      
      public function MouseLinesData()
      {
         super();
         this.ResetData();
      }
      
      public function Encode(byte_array:ByteArray) : void
      {
         a_2664.encode_int8(byte_array,this.m_iChatBubblesID);
         a_2664.encode_int32(byte_array,this.m_iTalkingMouseID);
         if(this.m_strLinesContent == null)
         {
            this.m_strLinesContent = "";
         }
         a_2664.encode_string(byte_array,this.m_strLinesContent,64);
         a_2664.encode_int16(byte_array,this.m_iShowTime);
      }
      
      public function Decode(byte_array:ByteArray, iCodeVersion:int = -1) : void
      {
         if(iCodeVersion == -1)
         {
            iCodeVersion = enmDIYWaveCodeVersion.enmDIYWaveLatestVersion;
         }
         switch(iCodeVersion)
         {
            case enmDIYWaveCodeVersion.enmDIYWaveOrignal:
               break;
            case enmDIYWaveCodeVersion.enmDIYWaveMouseTalk:
               this.m_iChatBubblesID = a_2664.decode_int8(byte_array);
               this.m_iTalkingMouseID = a_2664.decode_int32(byte_array);
               this.m_strLinesContent = a_2664.decode_string(byte_array,64);
               if(this.m_strLinesContent == null)
               {
                  this.m_strLinesContent = "";
               }
               break;
            case enmDIYWaveCodeVersion.enmDIYWaveMouseTalkOptimize:
            case enmDIYWaveCodeVersion.enmDIYWaveLatestVersion:
               this.m_iChatBubblesID = a_2664.decode_int8(byte_array);
               this.m_iTalkingMouseID = a_2664.decode_int32(byte_array);
               this.m_strLinesContent = a_2664.decode_string(byte_array,64);
               if(this.m_strLinesContent == null)
               {
                  this.m_strLinesContent = "";
               }
               this.m_iShowTime = a_2664.decode_int16(byte_array);
         }
      }
      
      public function CopyFromAnotherData(stMouseLinesData:MouseLinesData) : void
      {
         this.m_iChatBubblesID = stMouseLinesData.m_iChatBubblesID;
         this.m_iTalkingMouseID = stMouseLinesData.m_iTalkingMouseID;
         this.m_strLinesContent = stMouseLinesData.m_strLinesContent;
         this.m_iShowTime = stMouseLinesData.m_iShowTime;
      }
      
      public function IsSame(stMouseLinesData:MouseLinesData) : Boolean
      {
         return this.m_iChatBubblesID == stMouseLinesData.m_iChatBubblesID && this.m_iTalkingMouseID == stMouseLinesData.m_iTalkingMouseID && this.m_strLinesContent == stMouseLinesData.m_strLinesContent && this.m_iShowTime == stMouseLinesData.m_iShowTime;
      }
      
      public function ResetData() : void
      {
         this.m_iChatBubblesID = 0;
         this.m_iTalkingMouseID = 0;
         this.m_strLinesContent = "";
         this.m_iShowTime = 0;
      }
      
      public function IsHaveLines() : Boolean
      {
         return this.m_iChatBubblesID > 0 && this.m_iTalkingMouseID > 0 && this.m_strLinesContent != "";
      }
   }
}

