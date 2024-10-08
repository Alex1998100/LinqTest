﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.Identity.Client;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using TT.Lib;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace TT.Api.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class Export : ControllerBase
    {

        private readonly TTDbContext _db;

        public Export(TTDbContext db)
        {
            _db = db;
        }

        // GET Codes
        [HttpGet("/Codes")]
        public IActionResult Codes(string code)
        {
            return new OkObjectResult(_db.Products.Select(x => x.Key).ToList());

        }

        // GET Export/Smart S
        [HttpGet("{code}")]
        public IActionResult ProductDump(string code)
        {
            var prod1 = _db.Products.Where(x => x.Key.Equals(code)).Select(x => new Title(x.Id, x.Name, x.Key, x.BrandId, x.Brand.Name)).ToList();

            Record3 ret1 = new Record3();
            ret1.title = prod1.FirstOrDefault();
            ret1.staticProp = new List<OneStatic>();

            foreach (var x in prod1)
            {
                ret1.staticProp.AddRange(_db.ProductProperties.Where(y => y.ProductId.Equals(x.Id)).Select(z => new OneStatic(z.Id, z.Value, z.PropertyId, new List<OneDynamic>())).ToList());

            }
            foreach (OneStatic one in ret1.staticProp)
            {
                int startId = one.propertyId;
                do
                {
                    var ret2 = GetDynProp(startId);
                    if (ret2.Count == 0)
                    {
                        break;
                    }
                    else
                    {
                        one.dynProp.Add(ret2[0]);
                        startId = ret2[0].ParentId;
                    }
                } while (true);

            }
            return new OkObjectResult(ret1);
        }
        private List<OneDynamic> GetDynProp(int startId)
        {
            return _db.Properties.Where(x => x.Id.Equals(startId)).Select(x => new OneDynamic(x.Id, x.ParentId, x.Name)).ToList();
        }
    }
    record Title(int Id, string Name, string Key, int BrandId, string BrandName);
    struct OneStatic
    {
        public int ProductProperties_Id;
        public string value;
        public int propertyId;
        public List<OneDynamic> dynProp = new List<OneDynamic>();
        private int id;
        private List<OneDynamic> oneDynamics;

        public OneStatic(int id, string value, int propertyId, List<OneDynamic> oneDynamics) : this()
        {
            this.id = id;
            this.value = value;
            this.propertyId = propertyId;
            this.oneDynamics = oneDynamics;
        }
    };
    record OneDynamic(int id, int ParentId, string dynName);
    struct Record3
    {
        public Title title;
        public List<OneStatic> staticProp;
    }
}





