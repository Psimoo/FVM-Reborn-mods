package com.aurora.ui.maogoutd.component.dialog
{
   import com.aurora.ui.maogoutd.component.dialog.explain.AbstractDialog;
   import com.aurora.ui.maogoutd.component.dialog.explain.LiziDialogEvent;
   import flash.display.DisplayObjectContainer;
   import flash.utils.Dictionary;
   import flash.utils.getDefinitionByName;
   
   public class ExplainDialogManager
   {
      
      private static var _instance:ExplainDialogManager;
      
      private static var _index:int = 0;
      
      private var dialog_data:Dictionary;
      
      private var dialog_dict:Dictionary;
      
      private var dialog_reflect:Dictionary;
      
      private var dialog_mask:DialogMask;
      
      public function ExplainDialogManager()
      {
         super();
         ++_index;
         this.dialog_dict = new Dictionary();
         this.dialog_data = new Dictionary();
         if(_index > 1)
         {
            throw new Error("ExplainDialogManager can be create only once!");
         }
      }
      
      public static function get instance() : ExplainDialogManager
      {
         if(_instance == null)
         {
            _instance = new ExplainDialogManager();
         }
         return _instance;
      }
      
      public function initExplainDialogData(xml:XML) : void
      {
         var style_item:XML = null;
         var time_item:XML = null;
         var reflect_item:XML = null;
         var win_item:XML = null;
         var winObj:Object = null;
         var titleObj:Object = null;
         var content_item:XML = null;
         var contentObj:Object = null;
         for each(style_item in xml..explainStyle.style)
         {
            if(this.dialog_data["explain_style"] == null)
            {
               this.dialog_data["explain_style"] = new Dictionary();
            }
            this.dialog_data["explain_style"][int(style_item.@style_id)] = {
               "style_name":String(style_item.@style_name),
               "style_class":String(style_item.@style_class)
            };
         }
         for each(time_item in xml..explainTime.showTime)
         {
            if(this.dialog_data["explain_time"] == null)
            {
               this.dialog_data["explain_time"] = new Array();
            }
            (this.dialog_data["explain_time"] as Array).push({
               "time_name":String(time_item.@time_name),
               "dur_time":String(time_item.@dur_time),
               "style_id":Number(time_item.@style_id)
            });
         }
         for each(reflect_item in xml..explainReflection.reflect)
         {
            if(this.dialog_reflect == null)
            {
               this.dialog_reflect = new Dictionary(true);
            }
            this.dialog_reflect[String(reflect_item.@name)] = Number(reflect_item.@win_id);
         }
         for each(win_item in xml..explainWindow.window)
         {
            if(this.dialog_data["explain_window"] == null)
            {
               this.dialog_data["explain_window"] = new Dictionary();
            }
            winObj = new Object();
            this.dialog_data["explain_window"][int(win_item.@win_id)] = winObj;
            winObj.win_x = Number(win_item.@pos_x);
            winObj.win_y = Number(win_item.@pos_y);
            winObj.win_style_id = Number(win_item.@style_id);
            titleObj = {};
            titleObj.title_name = String(win_item.title.@title_name);
            titleObj.pos_x = Number(win_item.title.@pos_x);
            titleObj.pos_y = Number(win_item.title.@pos_y);
            titleObj.font_name = String(win_item.title.@font_name);
            titleObj.font_size = Number(win_item.title.@font_size);
            titleObj.font_color = Number(win_item.title.@font_color);
            titleObj.bold_open = String(win_item.title.@bold_open) == "true" ? true : false;
            titleObj.italic_open = String(win_item.title.@italic_open) == "true" ? true : false;
            titleObj.stroke_open = String(win_item.title.@stroke_open) == "true" ? true : false;
            titleObj.stroke_size = Number(win_item.title.@stroke_size);
            titleObj.stroke_color = Number(win_item.title.@stroke_color);
            winObj.win_title = titleObj;
            winObj.win_body = new Array();
            for each(content_item in win_item.content_body.content)
            {
               contentObj = {};
               contentObj.content_type = String(content_item.@content_type);
               contentObj.pos_x = Number(content_item.@pos_x);
               contentObj.pos_y = Number(content_item.@pos_y);
               if(contentObj.content_type == "content_txt")
               {
                  contentObj.content_name = String(content_item.@content_value);
                  contentObj.font_name = String(content_item.@font_name);
                  contentObj.font_size = Number(content_item.@font_size);
                  contentObj.font_color = Number(content_item.@font_color);
                  contentObj.bold_open = String(content_item.@bold_open) == "true" ? true : false;
                  contentObj.italic_open = String(content_item.@italic_open) == "true" ? true : false;
                  contentObj.stroke_open = String(content_item.@stroke_open) == "true" ? true : false;
                  contentObj.stroke_size = Number(content_item.@stroke_size);
                  contentObj.stroke_color = Number(content_item.@stroke_color);
               }
               else if(contentObj.content_type == "content_img")
               {
                  contentObj.image_url = String(content_item.@image_url);
                  contentObj.image_width = Number(content_item.@image_width);
                  contentObj.image_height = Number(content_item.@image_height);
               }
               (winObj.win_body as Array).push(contentObj);
            }
         }
      }
      
      public function showDialog(container:DisplayObjectContainer, reflectStr:String, useMask:Boolean = true) : void
      {
         if(this.dialog_reflect == null)
         {
            return;
         }
         if(this.dialog_reflect[reflectStr] == null)
         {
            return;
         }
         var dialog_id:int = int(this.dialog_reflect[reflectStr]);
         if(this.dialog_mask == null)
         {
            this.dialog_mask = new DialogMask(container.stage.stageWidth,container.stage.stageHeight,0,0.5);
         }
         if(this.dialog_dict[dialog_id] == null)
         {
            this.dialog_dict[dialog_id] = this.createDialog(container,dialog_id);
         }
         if(useMask == true)
         {
            container.addChild(this.dialog_mask);
         }
         (this.dialog_dict[dialog_id] as AbstractDialog).addEventListener(LiziDialogEvent.MS_DIALOG_OPEN,this.onDialogOpen);
         (this.dialog_dict[dialog_id] as AbstractDialog).addEventListener(LiziDialogEvent.MS_DIALOG_CLOSE,this.onDialogClose);
         (this.dialog_dict[dialog_id] as AbstractDialog).addEventListener(LiziDialogEvent.MS_DIALOG_SURE,this.onDialogSure);
         (this.dialog_dict[dialog_id] as AbstractDialog).addEventListener(LiziDialogEvent.MS_DIALOG_CANCEL,this.onDialogCancel);
         this.dialog_dict[dialog_id].open(container);
      }
      
      private function createDialog(container:DisplayObjectContainer, dialog_id:int) : AbstractDialog
      {
         var date:Date = null;
         var timeObj:Object = null;
         var times:Array = null;
         var starTime:Date = null;
         var endTime:Date = null;
         if(dialog_id <= 0)
         {
            throw new Error("Invalid dialog_id, create dialog failed!");
         }
         if(this.dialog_data["explain_window"] == null)
         {
            throw new Error("Window doesn\'t exist, create dialog failed!");
         }
         var dialog_style:int = 1;
         dialog_style = int(this.dialog_data["explain_window"][dialog_id].win_style_id);
         if(this.dialog_data["explain_time"] != null && this.dialog_data["explain_time"].length > 0)
         {
            date = new Date();
            for each(timeObj in this.dialog_data["explain_time"])
            {
               times = String(timeObj.dur_time).split("|");
               starTime = new Date(times[0]);
               endTime = new Date(times[1]);
               if(starTime.getTime() - date.getTime() <= 0)
               {
                  if(endTime.getTime() - date.getTime() >= 0)
                  {
                     dialog_style = int(timeObj.style_id);
                     break;
                  }
               }
            }
         }
         var dialog_class:Class = getDefinitionByName(this.dialog_data["explain_style"][dialog_style].style_class) as Class;
         return new dialog_class(container,dialog_id,this.dialog_data["explain_window"][dialog_id]);
      }
      
      private function onDialogOpen(e:LiziDialogEvent) : void
      {
         (this.dialog_dict[e.dialogData["dialog_id"]] as AbstractDialog).removeEventListener(LiziDialogEvent.MS_DIALOG_OPEN,this.onDialogOpen);
      }
      
      private function onDialogClose(e:LiziDialogEvent) : void
      {
         var dialog:AbstractDialog = this.dialog_dict[e.dialogData["dialog_id"]] as AbstractDialog;
         if(dialog.container.getChildByName(this.dialog_mask.name) != null)
         {
            dialog.container.removeChild(this.dialog_mask);
         }
         dialog.removeEventListener(LiziDialogEvent.MS_DIALOG_CLOSE,this.onDialogOpen);
         dialog.removeEventListener(LiziDialogEvent.MS_DIALOG_SURE,this.onDialogSure);
         dialog.removeEventListener(LiziDialogEvent.MS_DIALOG_CANCEL,this.onDialogCancel);
      }
      
      private function onDialogSure(e:LiziDialogEvent) : void
      {
         this.onDialogClose(e);
      }
      
      private function onDialogCancel(e:LiziDialogEvent) : void
      {
         this.onDialogClose(e);
      }
   }
}

