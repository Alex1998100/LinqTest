using System;
using System.Collections.Generic;
using System.Text;

namespace TT.Lib.Entities
{
    public class EntityBase
    {
        public const string DefaultSchema = "tt";
    }

    public class Base : IId
    {
        public int Id { get; set; }
    }

    public class BaseName : Base
    { 
        public string Name { get; set; }    
    }

    public interface IId
    { 
        public int Id { get; set; }
    }
}
