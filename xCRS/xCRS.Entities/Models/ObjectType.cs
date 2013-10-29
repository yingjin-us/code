using System;
using System.Collections.Generic;

namespace xCRS.Entities.Models
{
    public partial class ObjectType
    {
        public ObjectType()
        {
            this.QuestionsBanks = new List<QuestionsBank>();
        }

        public int id { get; set; }
        public string Name { get; set; }
        public virtual ICollection<QuestionsBank> QuestionsBanks { get; set; }
    }
}
