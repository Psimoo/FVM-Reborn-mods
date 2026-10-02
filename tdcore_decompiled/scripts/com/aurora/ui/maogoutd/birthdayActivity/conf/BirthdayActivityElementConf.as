package com.aurora.ui.maogoutd.birthdayActivity.conf
{
   import flash.utils.Dictionary;
   
   public class BirthdayActivityElementConf
   {
      
      public var startTm:int;
      
      public var endTm:int;
      
      public var awardEndTm:int;
      
      public var buyDailySignConf:BirthdayActivityBuyConf;
      
      public var buyCakeTicketConf:BirthdayActivityBuyConf;
      
      public var openSpecialActiveConf:BirthdayActivityOpenSpecialConf;
      
      public var dailySignConfAry:Vector.<BirthdayActivityDailySignItemConf>;
      
      public var cakeAwardConfAry:Vector.<BirthdayActivityCakeAwardItemConf>;
      
      public var animationsAry:Vector.<BirthdayActivityAnimationConf>;
      
      public var mailConf:BirthdayActivityMailConf;
      
      public var ruleConf:BirthdayActivityRuleConf;
      
      public var dailyTaskAwardConfDict:Dictionary;
      
      public function BirthdayActivityElementConf()
      {
         super();
         this.dailySignConfAry = new Vector.<BirthdayActivityDailySignItemConf>();
         this.cakeAwardConfAry = new Vector.<BirthdayActivityCakeAwardItemConf>();
         this.animationsAry = new Vector.<BirthdayActivityAnimationConf>();
         this.dailyTaskAwardConfDict = new Dictionary(true);
      }
      
      public function parseXml(xml:XML) : void
      {
         var aniItemXml:XML = null;
         var animationConf:BirthdayActivityAnimationConf = null;
         var dailySignAwardXml:XML = null;
         var dailySignXml:XML = null;
         var dailySignConf:BirthdayActivityDailySignItemConf = null;
         var cakeXml:XML = null;
         var cakeAwardsXml:XML = null;
         var cakeAwardConf:BirthdayActivityCakeAwardItemConf = null;
         var mailXml:XML = null;
         var ruleXml:XML = null;
         var dailyTaskAwardXml:XML = null;
         var dayAwardXml:XML = null;
         var dayAwardConf:BirthdayActivityDailyTaskAwardConf = null;
         this.startTm = xml.@startTm;
         this.endTm = xml.@endTm;
         this.awardEndTm = xml.@awardTm;
         var animationsXml:XML = xml.animations[0];
         for each(aniItemXml in animationsXml.animation)
         {
            animationConf = new BirthdayActivityAnimationConf();
            animationConf.id = aniItemXml.@id;
            animationConf.name = aniItemXml.@name;
            animationConf.swfName = aniItemXml.@swfName;
            animationConf.startFrame = aniItemXml.@startFrame;
            animationConf.endFrame = aniItemXml.@endFrame;
            animationConf.loopTm = aniItemXml.@loopTm;
            animationConf.x = aniItemXml.@x;
            animationConf.y = aniItemXml.@y;
            animationConf.bindClass = aniItemXml.@bindClass;
            this.animationsAry.push(animationConf);
         }
         this.buyDailySignConf = new BirthdayActivityBuyConf();
         this.buyDailySignConf.parseXml(xml.buyDailySign[0]);
         this.buyCakeTicketConf = new BirthdayActivityBuyConf();
         this.buyCakeTicketConf.parseXml(xml.buyCakeTicket[0]);
         this.openSpecialActiveConf = new BirthdayActivityOpenSpecialConf();
         this.openSpecialActiveConf.parseXml(xml.specialActive[0]);
         dailySignAwardXml = xml.dailySign[0];
         for each(dailySignXml in dailySignAwardXml.day)
         {
            dailySignConf = new BirthdayActivityDailySignItemConf();
            dailySignConf.parseXml(dailySignXml);
            this.dailySignConfAry.push(dailySignConf);
         }
         cakeAwardsXml = xml.cakeAwards[0];
         for each(cakeXml in cakeAwardsXml.award)
         {
            cakeAwardConf = new BirthdayActivityCakeAwardItemConf();
            cakeAwardConf.parseXml(cakeXml);
            this.cakeAwardConfAry.push(cakeAwardConf);
         }
         mailXml = xml.mail[0];
         this.mailConf = new BirthdayActivityMailConf();
         this.mailConf.parseXml(mailXml);
         ruleXml = xml.rule[0];
         this.ruleConf = new BirthdayActivityRuleConf();
         this.ruleConf.parseXml(ruleXml);
         dailyTaskAwardXml = xml.dailyTaskAward[0];
         for each(dayAwardXml in dailyTaskAwardXml.day)
         {
            dayAwardConf = new BirthdayActivityDailyTaskAwardConf();
            dayAwardConf.parseXml(dayAwardXml);
            this.dailyTaskAwardConfDict[dayAwardConf.day] = dayAwardConf;
         }
      }
   }
}

