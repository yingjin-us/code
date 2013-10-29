using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace xCRS.Entities.Models.Mapping
{
    public class HRTransactionTypeMap : EntityTypeConfiguration<HRTransactionType>
    {
        public HRTransactionTypeMap()
        {
            // Primary Key
            this.HasKey(t => t.id);

            // Properties
            this.Property(t => t.name)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.createdBy)
                .HasMaxLength(12);

            this.Property(t => t.updatedBy)
                .HasMaxLength(12);

            // Table & Column Mappings
            this.ToTable("HRTransactionTypes");
            this.Property(t => t.id).HasColumnName("id");
            this.Property(t => t.name).HasColumnName("name");
            this.Property(t => t.description).HasColumnName("description");
            this.Property(t => t.createdBy).HasColumnName("createdBy");
            this.Property(t => t.createdOn).HasColumnName("createdOn");
            this.Property(t => t.updatedBy).HasColumnName("updatedBy");
            this.Property(t => t.updatedOn).HasColumnName("updatedOn");
        }
    }
}
