using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Text;

namespace TT.Lib.Extensions
{
    public static class ConfigurationExtension
    {
        public static T GetConfig<T>(this IConfiguration config) 
            where T : class, new()
        {
            var t = new T();

            config.GetSection(typeof(T).Name).Bind(t);

            return t;
        }
    }
}
