package com.aurora.ui.maogoutd.im
{
   import a_4720.EnmGameIM;
   import a_4752.GameStringManager;
   import a_4752.IGameStringManager;
   import com.adobe.crypto.MD5;
   import com.adobe.serialization.json.JSONDecoder;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   
   public class IMUtil
   {
      
      private static var gsManager:IGameStringManager = GameStringManager.getInstance();
      
      public function IMUtil()
      {
         super();
      }
      
      public static function sysMsgEncode(msg:String, level:int = -1) : String
      {
         var xml:XML = <control value="display" id="0" level="0">
						<zone tip="1">
							<font name="" size="12" r="0" g="82" b="121">
								<content>
									<![CDATA[]]>
								</content>
							</font>
							<parameter href="" displaytime="10" buttontype="1"/>
							<loop interval="" endtime=""/>
						</zone>
				</control>;
         xml.@level = level;
         xml..content[0].replace("*",new XML("<![CDATA[" + msg + "]]>"));
         return xml.toXMLString();
      }
      
      public static function sysMsgDecode(msg:String) : Object
      {
         var xml:XML = null;
         var content:XMLList = null;
         var obj:Object = {};
         try
         {
            xml = new XML(msg);
            content = xml..content;
            if(content == null)
            {
               obj.content = gsManager.getString(133131);
            }
            else if(content.length() == 0)
            {
               obj.content = gsManager.getString(133131);
            }
            else
            {
               obj.content = xml..content[0].text();
            }
            obj.level = xml.@level;
            if(!obj.level)
            {
               obj.level = -1;
            }
         }
         catch(e:Error)
         {
            trace("sysMsgDecode 错误>>" + e);
         }
         return obj;
      }
      
      public static function receiveMsgDecode(msg:String) : Object
      {
         if(msg.indexOf("${TAG:") != 0)
         {
            throw new Error("开始标志不正确，应该为:${TAG:");
         }
         if(msg.indexOf("}$+") == -1)
         {
            throw new Error("结束标志不正确，应该为:}$+");
         }
         var o:Object = {};
         var temp:Array = msg.split("}$+");
         o.msg = temp[1];
         temp[0] = temp[0].replace("${TAG:","");
         temp = temp[0].split("}{");
         o.tag = int(temp[0]);
         temp[1] = temp[1].replace("USER:","");
         temp = temp[1].split("->");
         o.fUser = temp[0];
         o.tUser = temp[1];
         return o;
      }
      
      public static function userDecode(user:String) : Array
      {
         var a:Array = user.split("{&}");
         if(a.length > 1)
         {
            a[1] = decodeURIComponent(a[1]);
         }
         return a;
      }
      
      public static function userEncode(uin:int, nickName:String, flag:int = -1) : String
      {
         var showstr:String = FormatUserNameForShow(nickName);
         var str:String = uin.toString() + "{&}" + encodeURIComponent(showstr);
         if(flag != -1)
         {
            str += "{&}" + flag.toString();
         }
         return str;
      }
      
      public static function sendMsgFormat(oMsg:Object) : String
      {
         if(oMsg.tag == undefined)
         {
            throw new Error("必须提供Tag标志");
         }
         var str:String = "${TAG:" + oMsg.tag + "}{USER:";
         if(oMsg.fUser != undefined)
         {
            str += oMsg.fUser;
            if(oMsg.tUser != undefined)
            {
               str += "->" + oMsg.tUser;
            }
         }
         return str + ("}$+" + oMsg.msg);
      }
      
      public static function showUserInMsgFormat(uin:int, czName:String) : String
      {
         var str:String = "<font color=\'" + IMConfig.getUserNameColor() + "\'>";
         var showstr:String = FormatUserNameForShow(czName);
         var urlstr:String = FormatUserNameForURL(czName);
         if(uin > 0)
         {
            str += "[<a href=\"event:" + uin + "{&}" + urlstr + "\">" + showstr + "</a>]</font>";
         }
         else
         {
            str += "[" + showstr + "]</font>";
         }
         return str;
      }
      
      public static function showMsgFormat(oMsg:Object, uin:String) : String
      {
         var str:String = null;
         var fUser:Array = null;
         var tUser:Array = null;
         var user:String = null;
         var defaultSize:int = IMConfig.getDefaultFontSize();
         var color:String = IMConfig.getMsgColor(oMsg.tag);
         var urlstr:String = FormatUserNameForURL(oMsg.fUser);
         for(var k:int = 0; k < urlstr.length; k++)
         {
            urlstr = urlstr.replace("&lt;","%3C");
            urlstr = urlstr.replace("<","%3C");
            urlstr = urlstr.replace("&gt;","%3E");
            urlstr = urlstr.replace(">","%3E");
         }
         trace("cao");
         if(oMsg.tag == EnmGameIM.a_506)
         {
            fUser = userDecode(oMsg.fUser);
            tUser = userDecode(oMsg.tUser);
            fUser[1] = FormatUserNameForShow(fUser[1]);
            if(String(fUser[0]) == uin)
            {
               str = "<font color=\'" + color + "\' size=\'" + defaultSize + "\'>";
               str += gsManager.getString(133132) + "[<a href=\"event:" + urlstr + "\">" + IMConfig.getUserFlagDisplay(tUser[2]) + tUser[1] + "</a>]" + gsManager.getString(133133) + oMsg.msg;
            }
            else
            {
               if(String(tUser[0]) != uin)
               {
                  throw new Error("私聊消息错误：当前用户ID=" + uin + ",fUin=" + fUser[0] + ",tUin=" + tUser[0] + ",3者没有两个是一样的！");
               }
               str = "<font color=\'" + color + "\' size=\'" + defaultSize + "\'>";
               str += "[<a href=\"event:" + urlstr + "\">" + IMConfig.getUserFlagDisplay(fUser[2]) + fUser[1] + "</a>]" + gsManager.getString(133134) + oMsg.msg;
            }
         }
         else
         {
            str = "<font color=\'" + color + "\' size=\'" + defaultSize + "\'>";
            user = "";
            fUser = userDecode(oMsg.fUser);
            if(fUser.length > 1)
            {
               fUser[1] = FormatUserNameForShow(fUser[1]);
               user = IMConfig.getUserFlagDisplay(fUser[2]) + fUser[1];
            }
            if("" == user)
            {
               str += "【" + IMConfig.getMsgGroupName(oMsg.tag) + "】<a href=\"event:" + urlstr + "\">" + user + "</a>" + gsManager.getString(133133) + oMsg.msg;
            }
            else
            {
               str += "【" + IMConfig.getMsgGroupName(oMsg.tag) + "】[<a href=\"event:" + urlstr + "\">" + user + "</a>]" + gsManager.getString(133133) + oMsg.msg;
            }
         }
         return str + "</font>";
      }
      
      public static function FormatUserNameForShow(str:String) : String
      {
         var userName:String = str;
         for(var i:int = 0; i < userName.length; i++)
         {
            userName = userName.replace("<","&lt;");
            userName = userName.replace(">","&gt;");
         }
         return userName;
      }
      
      public static function FormatUserNameForURL(str:String) : String
      {
         var userName:String = str;
         for(var i:int = 0; i < userName.length; i++)
         {
            userName = userName.replace("&lt;","%3C");
            userName = userName.replace("<","%3C");
            userName = userName.replace("&gt;","%3E");
            userName = userName.replace(">","%3E");
         }
         return userName;
      }
      
      public static function MatchWord(stage:Stage, msg:String, callback:Function) : void
      {
         var url:String = null;
         var secret:String = null;
         var toCheck:String = null;
         var _request:URLRequest = null;
         var loader:URLLoader = null;
         if(Boolean(stage) && Boolean(stage.loaderInfo.parameters.sitetype == "4399") || Boolean(stage) && Boolean(stage.loaderInfo.parameters.sitetype == "joyyou"))
         {
            url = "https://wo.webgame138.com/test/matchService.do";
            secret = "987fea36f4daae2b7872b0ae8b1e33a7";
            toCheck = msg;
            url += "?toCheck=" + encodeURIComponent(toCheck) + "&app=" + "msdzls" + "&byPinyin=" + "true" + "&sig=" + "" + MD5.hash(secret + toCheck);
            _request = new URLRequest();
            _request.url = url;
            _request.method = URLRequestMethod.POST;
            loader = new URLLoader();
            loader.addEventListener(Event.COMPLETE,function(evt:Event):void
            {
               var data:String = null;
               var i:int = 0;
               var replaceString:String = null;
               var j:int = 0;
               var oldPlaceStr:String = null;
               var stJsonDecode:JSONDecoder = new JSONDecoder(evt.target.data as String);
               var word:Array = new Array();
               for(data in stJsonDecode.getValue())
               {
                  word.push(stJsonDecode.getValue()[data]);
               }
               for(i = 0; i < word.length; i++)
               {
                  replaceString = "";
                  for(j = int(word[i].startPos); j <= word[i].endPos; j++)
                  {
                     replaceString += "*";
                  }
                  oldPlaceStr = toCheck.slice(word[i].startPos,word[i].endPos + 1);
                  toCheck = toCheck.replace(oldPlaceStr,replaceString);
               }
               callback(toCheck);
            });
            loader.load(_request);
         }
         else
         {
            callback(msg);
         }
      }
   }
}

