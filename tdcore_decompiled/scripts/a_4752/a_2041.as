package a_4752
{
   import com.aurora.ui.maogoutd.component.a_3286;
   import com.aurora.ui.maogoutd.pag.RecipeItem;
   import com.aurora.ui.maogoutd.pag.RecipeXMLParser;
   import flash.utils.Dictionary;
   
   public class a_2041
   {
      
      private static var instance:a_2041;
      
      public var m_dictSkillCards:Dictionary;
      
      public var m_dictGoldSkillHelper:Dictionary;
      
      public var m_dictSkillBooks:Dictionary;
      
      public var a_1245:Array;
      
      public function a_2041()
      {
         super();
         this.m_dictSkillCards = new Dictionary();
         this.m_dictGoldSkillHelper = new Dictionary();
         this.m_dictSkillBooks = new Dictionary();
      }
      
      public static function getInstance() : a_2041
      {
         if(instance == null)
         {
            instance = new a_2041();
         }
         return instance;
      }
      
      public function GetSkillCardsByType(iType:int) : Array
      {
         var arrRet:Array = null;
         if(iType == 4)
         {
            return this.a_1245;
         }
         arrRet = [];
         for(var i:int = 0; i < this.a_1245.length; i++)
         {
            if(this.a_1245[i].iType == iType)
            {
               arrRet.push(this.a_1245[i]);
            }
         }
         return arrRet;
      }
      
      public function a_2042(skillBookXML:XML) : Boolean
      {
         var skillXml:XML = null;
         var iCardID:int = 0;
         var effectDesc:String = null;
         var bookName:String = null;
         var arrBooks:Array = null;
         var bookXml:XML = null;
         var book:a_3286 = null;
         var bookID:int = 0;
         var coin:int = 0;
         var point:int = 0;
         var bookLevel:int = 0;
         var type:int = 0;
         var fatherCard:int = 0;
         var arrItems:Array = null;
         var iAllCount:int = 0;
         var iMaxLevel:int = 0;
         var iMinLevel:int = 0;
         var elementXml:XML = null;
         var count:int = 0;
         var level:int = 0;
         var value:int = 0;
         var item:Object = null;
         if(skillBookXML != null)
         {
            for each(skillXml in skillBookXML.item)
            {
               iCardID = int(skillXml.@id);
               effectDesc = String(skillXml.@effect_desc);
               bookName = String(skillXml.@name);
               arrBooks = [];
               for each(bookXml in skillXml.book)
               {
                  book = new a_3286();
                  bookID = int(bookXml.@id);
                  coin = int(bookXml.@coin);
                  point = int(bookXml.@point);
                  bookLevel = int(bookXml.@level);
                  type = int(skillXml.@type);
                  fatherCard = int(skillXml.@fathercard);
                  book.iBookID = bookID;
                  book.iCoin = coin;
                  book.iBookLevel = bookLevel;
                  book.iCardID = iCardID;
                  book.effectDesc = effectDesc;
                  book.bookName = bookName;
                  book.iPoint = point;
                  book.iType = type;
                  book.iFatherCard = fatherCard;
                  arrItems = [];
                  iAllCount = 0;
                  iMaxLevel = 0;
                  iMinLevel = 10000;
                  for each(elementXml in bookXml.element)
                  {
                     count = int(elementXml.@count);
                     level = int(elementXml.@level);
                     value = int(elementXml.@value);
                     item = new Object();
                     iMaxLevel = level > iMaxLevel ? level : iMaxLevel;
                     iMinLevel = level < iMinLevel ? level : iMinLevel;
                     item.count = count;
                     item.level = level;
                     item.value = value;
                     iAllCount += count;
                     arrItems.push(item);
                  }
                  book.iMaxLevel = iMaxLevel;
                  book.iMinLevel = iMinLevel;
                  book.arrItems = arrItems;
                  book.iAllCount = iAllCount;
                  arrBooks.push(book);
               }
               this.m_dictSkillCards[iCardID] = arrBooks;
            }
         }
         return true;
      }
      
      public function a_2043(arrUseSkillCards:Array) : void
      {
         var book:Object = null;
         var arrBooks:Array = null;
         var isOpened:Boolean = false;
         var iCardID:int = 0;
         var skillBook:a_3286 = null;
         var useBook:Object = null;
         var dictUseBooks:Dictionary = new Dictionary();
         for each(book in arrUseSkillCards)
         {
            dictUseBooks[book.m_iSkillID] = book;
         }
         if(this.a_1245 != null)
         {
            this.a_1245.splice(0);
         }
         else
         {
            this.a_1245 = [];
         }
         for each(arrBooks in this.m_dictSkillCards)
         {
            isOpened = false;
            iCardID = 0;
            for each(skillBook in arrBooks)
            {
               iCardID = skillBook.iCardID;
               useBook = dictUseBooks[iCardID];
               if(useBook != null && useBook.m_nSkillLevel == skillBook.iBookLevel)
               {
                  skillBook.iSkillOpened = useBook.m_iSkillOpened;
                  skillBook.iSkillUsed = useBook.m_iSkillUsed;
                  skillBook.nSkillLevel = useBook.m_nSkillLevel;
                  this.a_1245.push(skillBook);
                  this.m_dictSkillBooks[iCardID] = skillBook;
                  isOpened = true;
               }
               else
               {
                  skillBook.iSkillUsed = 0;
                  skillBook.nSkillLevel = 0;
                  skillBook.iSkillOpened = 0;
               }
            }
            if(!isOpened)
            {
               this.a_1245.push(arrBooks[0]);
               this.m_dictSkillBooks[iCardID] = arrBooks[0];
            }
         }
         this.setGoldHelper();
      }
      
      public function setGoldHelper() : void
      {
         var recipeData:RecipeItem = null;
         var iValue:int = 0;
         var i:int = 0;
         iValue = int(35 * (this.getValueByLevel(this.m_dictSkillBooks[286457972].CurrentLevel) * 70 + this.getValueByLevel(this.m_dictSkillBooks[286457952].CurrentLevel) * 30) / 10000);
         recipeData = RecipeXMLParser.instance().getGoldHelpRecipeByID(10000001);
         for(i = 0; i < recipeData.cards.length; i++)
         {
            this.m_dictGoldSkillHelper[int(recipeData.cards[i])] = iValue;
         }
         iValue = int(35 * (this.getValueByLevel(this.m_dictSkillBooks[286458084].CurrentLevel) * 70 + this.getValueByLevel(this.m_dictSkillBooks[286458032].CurrentLevel) * 30) / 10000);
         recipeData = RecipeXMLParser.instance().getGoldHelpRecipeByID(10000002);
         for(i = 0; i < recipeData.cards.length; i++)
         {
            this.m_dictGoldSkillHelper[int(recipeData.cards[i])] = iValue;
         }
         iValue = int(120 * (this.getValueByLevel(this.m_dictSkillBooks[286458052].CurrentLevel) * 70 + this.getValueByLevel(this.m_dictSkillBooks[286458016].CurrentLevel) * 30) / 10000);
         recipeData = RecipeXMLParser.instance().getGoldHelpRecipeByID(10000003);
         for(i = 0; i < recipeData.cards.length; i++)
         {
            this.m_dictGoldSkillHelper[int(recipeData.cards[i])] = iValue;
         }
         iValue = int(15 * (this.getValueByLevel(this.m_dictSkillBooks[294846580].CurrentLevel) * 70 + this.getValueByLevel(this.m_dictSkillBooks[294850656].CurrentLevel) * 30) / 10000);
         recipeData = RecipeXMLParser.instance().getGoldHelpRecipeByID(10000004);
         for(i = 0; i < recipeData.cards.length; i++)
         {
            this.m_dictGoldSkillHelper[int(recipeData.cards[i])] = iValue;
         }
         iValue = int(10 * (this.getValueByLevel(this.m_dictSkillBooks[286457956].CurrentLevel) * 70 + this.getValueByLevel(this.m_dictSkillBooks[289603632].CurrentLevel) * 30) / 10000);
         recipeData = RecipeXMLParser.instance().getGoldHelpRecipeByID(10000005);
         for(i = 0; i < recipeData.cards.length; i++)
         {
            this.m_dictGoldSkillHelper[int(recipeData.cards[i])] = iValue;
         }
         iValue = int(2 * (this.getValueByLevel(this.m_dictSkillBooks[286326868].CurrentLevel) * 70 + this.getValueByLevel(this.m_dictSkillBooks[286326804].CurrentLevel) * 30) / 10000);
         recipeData = RecipeXMLParser.instance().getGoldHelpRecipeByID(10000006);
         for(i = 0; i < recipeData.cards.length; i++)
         {
            this.m_dictGoldSkillHelper[int(recipeData.cards[i])] = iValue;
         }
      }
      
      public function getFirePoint() : Number
      {
         return Number(2 * (this.getValueByLevel(this.m_dictSkillBooks[286326868].CurrentLevel) * 70 + this.getValueByLevel(this.m_dictSkillBooks[286326804].CurrentLevel) * 30) / 10000);
      }
      
      public function getValueByLevel(iLevel:*) : int
      {
         if(iLevel == 1)
         {
            return 5;
         }
         if(iLevel == 2)
         {
            return 10;
         }
         if(iLevel == 3)
         {
            return 15;
         }
         if(iLevel == 4)
         {
            return 25;
         }
         if(iLevel == 5)
         {
            return 35;
         }
         if(iLevel == 6)
         {
            return 50;
         }
         if(iLevel == 7)
         {
            return 65;
         }
         if(iLevel == 8)
         {
            return 100;
         }
         return 0;
      }
      
      public function getNextLevelBook(iCardID:int, iBookID:int, iLevel:int) : int
      {
         var arrBooks:Array = null;
         var skillBook:a_3286 = null;
         var iNextBookID:int = -1;
         if(this.m_dictSkillCards != null)
         {
            arrBooks = this.m_dictSkillCards[iCardID];
            for each(skillBook in arrBooks)
            {
               if(skillBook.iBookLevel == iLevel + 1)
               {
                  iNextBookID = skillBook.iBookID;
                  break;
               }
               iNextBookID = -1;
            }
         }
         return iNextBookID;
      }
   }
}

