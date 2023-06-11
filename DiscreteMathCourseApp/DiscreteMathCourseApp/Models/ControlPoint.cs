//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DiscreteMathCourseApp.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ControlPoint
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ControlPoint()
        {
            this.UserControlPoints = new HashSet<UserControlPoint>();
        }
    
        public int Id { get; set; }
        public int TopicId { get; set; }
        public string TaskTitle { get; set; }
        public string AnswerTitle { get; set; }
        public int IndexNumber { get; set; }
        public string TaskLink { get; set; }
        public string AnswerLink { get; set; }
    
        public virtual Topic Topic { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserControlPoint> UserControlPoints { get; set; }
    }
}