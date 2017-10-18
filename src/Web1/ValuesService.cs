using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Web1
{
    public class ValuesService : IValuesService
    {
        private string value1;
        private string value2;

        public ValuesService(string value1, string value2)
        {
            this.value1 = value1;
            this.value2 = value2;
        }

        public string GetValue1()
        {
            return this.value1;
        }

        public string GetValue2()
        {
            return this.value2;
        }
    }
}
