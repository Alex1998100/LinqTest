using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace TT.Lib.Entities
{
    public class Hardware : BaseName, IId
    {
        [MaxLength(63)]
        public string Key { get; set; }

        public int BrandId { get; set; }

        public virtual Brand Brand { get; set; }
    }
}
