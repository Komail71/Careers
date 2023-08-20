using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SEDA.Careers.Entities
{
    [Serializable]
   public class Language
    {
        public int LanguageID { get; set; }

        public string LanguageTitle { get; set; }

        public int ProficienyId { get; set; }

        public string ProficienyTitle { get; set;  }

        public int RowIndex { get; set; }


    }
}
