using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SEDA.Careers.Entities
{
    [Serializable]
  public  class Education
    {
        public int DegreeId { get; set; }

        public string DegreeTitle { get; set; }

        public int CounrtyId { get; set; }

        public string CounrtyTitle { get; set; }

        public string WorkCity { get; set; }

        public string University { get; set; }

        public string Major { get; set; }

        public string GPAnum { get; set; }

        public string GPA { get; set; }

        public string GraduationDate { get; set; }

        public string Description { get; set; }

        public int RowIndex { get; set; }
    }
}
