using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace xCRS.Entities.Models.Mapping
{
    public class AnswersBankMap : EntityTypeConfiguration<AnswersBank>
    {
        public AnswersBankMap()
        {
            // Primary Key
            this.HasKey(t => t.id);

            // Properties
            this.Property(t => t.createdBy)
                .HasMaxLength(12);

            this.Property(t => t.updatedBy)
                .HasMaxLength(12);

            // Table & Column Mappings
            this.ToTable("AnswersBank");
            this.Property(t => t.id).HasColumnName("id");
            this.Property(t => t.QuestionId).HasColumnName("QuestionId");
            this.Property(t => t.AnswerText).HasColumnName("AnswerText");
            this.Property(t => t.is_sql).HasColumnName("is_sql");
            this.Property(t => t.active).HasColumnName("active");
            this.Property(t => t.createdBy).HasColumnName("createdBy");
            this.Property(t => t.createdOn).HasColumnName("createdOn");
            this.Property(t => t.updatedBy).HasColumnName("updatedBy");
            this.Property(t => t.updatedOn).HasColumnName("updatedOn");

            // Relationships
            this.HasRequired(t => t.QuestionsBank)
                .WithMany(t => t.AnswersBanks)
                .HasForeignKey(d => d.QuestionId);

        }
    }
}
