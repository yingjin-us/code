using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace xCRS.Entities.Models.Mapping
{
    public class ExceptionRuleMap : EntityTypeConfiguration<ExceptionRule>
    {
        public ExceptionRuleMap()
        {
            // Primary Key
            this.HasKey(t => t.id);

            // Properties
            this.Property(t => t.createdBy)
                .HasMaxLength(12);

            this.Property(t => t.updatedBy)
                .HasMaxLength(12);

            // Table & Column Mappings
            this.ToTable("ExceptionRules");
            this.Property(t => t.id).HasColumnName("id");
            this.Property(t => t.QuestionId).HasColumnName("QuestionId");
            this.Property(t => t.Answer).HasColumnName("Answer");
            this.Property(t => t.nextQuestionId).HasColumnName("nextQuestionId");
            this.Property(t => t.createdBy).HasColumnName("createdBy");
            this.Property(t => t.createdOn).HasColumnName("createdOn");
            this.Property(t => t.updatedBy).HasColumnName("updatedBy");
            this.Property(t => t.updatedOn).HasColumnName("updatedOn");
            this.Property(t => t.active).HasColumnName("active");

            // Relationships
            this.HasOptional(t => t.QuestionsBank)
                .WithMany(t => t.ExceptionRules)
                .HasForeignKey(d => d.QuestionId);
            this.HasOptional(t => t.QuestionsBank1)
                .WithMany(t => t.ExceptionRules1)
                .HasForeignKey(d => d.nextQuestionId);

        }
    }
}
