using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace xCRS.Entities.Models.Mapping
{
    public class ObjectTypeMap : EntityTypeConfiguration<ObjectType>
    {
        public ObjectTypeMap()
        {
            // Primary Key
            this.HasKey(t => t.id);

            // Properties
            this.Property(t => t.Name)
                .IsRequired()
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("ObjectTypes");
            this.Property(t => t.id).HasColumnName("id");
            this.Property(t => t.Name).HasColumnName("Name");
        }
    }
}
