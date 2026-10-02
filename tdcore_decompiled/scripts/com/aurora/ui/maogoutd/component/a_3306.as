package com.aurora.ui.maogoutd.component
{
   public class a_3306
   {
      
      public var CardID:int;
      
      public var Use:String;
      
      public var Name:String;
      
      public var Type:String;
      
      public var Area:String;
      
      public var Desc:String;
      
      public var Bind:String;
      
      public var AttrType:String;
      
      public var Effect:String;
      
      public var Comefrom:String;
      
      public var PeiFang:String;
      
      public var Hp:String;
      
      public var Index:int;
      
      public var ID:String;
      
      public var Slogan:String;
      
      public var Speed:String;
      
      public var Hit:String;
      
      public function a_3306()
      {
         super();
         this.AttrType = "";
      }
      
      public function setMouseDesc(item:XML) : void
      {
         this.Name = item.@name;
         this.Type = item.@type;
         this.Desc = item.@desc;
         this.Hit = item.@hit_point;
         this.Slogan = item.@slogan;
         this.Speed = item.@speed;
         this.ID = item.@id;
         this.Index = item.@index;
      }
      
      public function setCardDesc(item:XML) : void
      {
         this.CardID = item.@id;
         this.Use = item.@energy;
         this.Name = item.@name;
         this.Type = item.@type;
         this.Area = item.@effect_area;
         this.Desc = item.@desc;
         this.Effect = item.@effect_condition;
         this.AttrType = item.@strengthen_desc;
         this.Comefrom = item.@comefrom;
         this.PeiFang = item.@detail;
         this.Hp = item.@hp;
         this.Index = item.@index;
      }
   }
}

