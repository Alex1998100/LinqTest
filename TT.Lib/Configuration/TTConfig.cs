using System;
using System.Collections.Generic;
using System.Text;

namespace TT.Lib.Configuration
{
    public class TTConfig
    {
        public class TTConfigCors
        { 
            public IEnumerable<string> Origins { get; set; }
        }

        public TTConfigCors Cors { get; set; }
    }
}
