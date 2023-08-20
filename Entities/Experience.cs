using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SEDA.Careers.Entities
{
    [Serializable]
   public class Experience
    {

        public string HaveExperience { get; set; }

        public string StartDate { get; set; }

        public string EndDate { get; set; }

        public int LocationId { get; set; }

        public string LocationTitle { get; set; }

        public string City { get; set; }

        public string CompanyName { get; set; }

        public string JobTitle { get; set; }

        public string JobDescription { get; set; }

        public int RowIndex { get; set; }
    }
}
