using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace xCRS.Entities.Models.Mapping
{
    public class QuestionsBankMap : EntityTypeConfiguration<QuestionsBank>
    {
        public QuestionsBankMap()
        {
            // Primary Key
            this.HasKey(t => t.id);

            // Properties
            this.Property(t => t.QuestionText)
                .IsRequired();

            this.Property(t => t.CreatedBy)
                .HasMaxLength(12);

            this.Property(t => t.UpdatedBy)
                .HasMaxLength(120);

            // Table & Column Mappings
            this.ToTable("QuestionsBank");
            this.Property(t => t.id).HasColumnName("id");
            this.Property(t => t.HRTransactionTypeId).HasColumnName("HRTransactionTypeId");
            this.Property(t => t.QuestionText).HasColumnName("QuestionText");
            this.Property(t => t.active).HasColumnName("active");
            this.Property(t => t.CreatedBy).HasColumnName("CreatedBy");
            this.Property(t => t.CreatedOn).HasColumnName("CreatedOn");
            this.Property(t => t.UpdatedBy).HasColumnName("UpdatedBy");
            this.Property(t => t.UpdatedOn).HasColumnName("UpdatedOn");
            this.Property(t => t.ObjectTypeId).HasColumnName("ObjectTypeId");
            this.Property(t => t.SortOrder).HasColumnName("SortOrder");

            // Relationships
            this.HasRequired(t => t.HRTransactionType)
                .WithMany(t => t.QuestionsBanks)
                .HasForeignKey(d => d.HRTransactionTypeId);
            this.HasOptional(t => t.ObjectType)
                .WithMany(t => t.QuestionsBanks)
                .HasForeignKey(d => d.ObjectTypeId);

        }
    }
}
