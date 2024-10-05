using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using TT.Lib.DataAccess;

namespace TT.Lib.Entities
{
    public class Product : BaseName, IId
    {
        public ICollection<ProductProperty> Properties { get; set; }

        [MaxLength(63)]
        public string Key { get; set; }

        public int BrandId { get; set; }

        public virtual Brand Brand { get; set; }
    }
}
