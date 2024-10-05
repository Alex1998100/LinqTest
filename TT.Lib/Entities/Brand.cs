using System;
using System.Collections.Generic;
using System.Text;

namespace TT.Lib.Entities
{
    public class Brand : BaseName, IId
    {
        public ICollection<Product> Products { get; set; }
    }
}
