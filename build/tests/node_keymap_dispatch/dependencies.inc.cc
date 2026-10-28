// Portable native dependencies. Raw DNA and PointerRNA declarations are extracted.
#define BLI_INLINE inline
#define UNLIKELY(x) (x)
#define STREQ(a,b) (std::strcmp(a,b)==0)
#define STREQLEN(a,b,n) (std::strncmp(a,b,n)==0)
#define STRNCPY(a,b) do{std::snprintf(a,sizeof(a),"%s",b);}while(0)
#define STRNCPY_UTF8 STRNCPY
#define LISTBASE_FOREACH_MUTABLE(T,v,l) for(auto v=static_cast<T>((l)->first),v##_next=v?v->next:nullptr;v;v=v##_next,v##_next=v?v->next:nullptr)
#define KMI_PARAMS_MOD_TO_ANY(x) ((x)<<8)
#define KMI_PARAMS_MOD_FROM_ANY(x) ((x)>>8)
#define OP_MAX_TYPENAME 64
#define KMAP_MAX_NAME 64
#define DEFAULT_ALLOC_FOR_NULL_STRINGS 64
#define OP_PY_SEP_CHAR '.'
#define OP_MAX_PY_IDNAME 61
#define OP_PY_SEP_LEN 1
#define OP_BL_SEP_STRING "_OT_"
#define OP_BL_SEP_LEN 4
#define RPT_ERROR 1
#define CLOG_WARN(...) ((void)0)
namespace blender{struct StringRef{const char*p;StringRef(const char*p):p(p){}template<size_t N>void copy_utf8_truncated(char(&d)[N])const{std::snprintf(d,N,"%s",p);}};}
using blender::StringRef;
struct wmRuntime{ListBase keyconfigs{};wmKeyConfig*defaultconf=nullptr,*addonconf=nullptr,*userconf=nullptr;};
struct Main{ListBase wm{};};static Main main_data;static Main*G_MAIN=&main_data;
static StructRNA RNA_OperatorProperties,RNA_Struct;
static const char*RNA_struct_state_owner_get(){return nullptr;}
static void BKE_report(ReportList*,int,const char*){std::abort();}
static void BKE_reportf(ReportList*,int,const char*){std::abort();}
static void rna_pointer_refine(PointerRNA&){std::abort();}
static void BLI_listbase_clear(ListBase*l){l->first=l->last=nullptr;}
static bool BLI_listbase_is_empty(const ListBase*l){return !l->first;}
static bool BLI_str_endswith(const char*s,const char*t){auto a=std::strlen(s),b=std::strlen(t);return a>=b&&std::strcmp(s+a-b,t)==0;}
static size_t BLI_strncpy_rlen(char*d,const char*s,size_t n){auto l=std::min(std::strlen(s),n-1);std::memcpy(d,s,l);d[l]=0;return l;}
static void BLI_strncpy(char*d,const char*s,size_t n){BLI_strncpy_rlen(d,s,n);}
static void BLI_str_toupper_ascii(char*d,size_t n){for(size_t i=0;i<n;++i)d[i]=char(std::toupper(static_cast<unsigned char>(d[i])));}
template<class T>T*MEM_new(const char*){return new T{};}
template<class T>void MEM_delete(T*p){delete p;}
static void*MEM_dupallocN(const void*p){if(!p)return nullptr;size_t n=native_sizes.at(const_cast<void*>(p));void*q=std::malloc(n);native_sizes[q]=n;std::memcpy(q,p,n);return q;}
static void*MEM_calloc_arrayN(size_t,size_t,const char*){std::abort();}
template<class T>T*MEM_malloc_arrayN(size_t,const char*){std::abort();}
static IDPropertyUIData*IDP_ui_data_copy(const IDProperty*){std::abort();}
static char*IDP_String(IDProperty*p){return static_cast<char*>(p->data.pointer);}
static ID*IDP_Id(IDProperty*p){return static_cast<ID*>(p->data.pointer);}
static void id_us_plus(ID*){std::abort();}
static int idp_size_table[11]{};
struct IDPropertyDeleter{void operator()(IDProperty*p)const{MEM_freeN(p);}};
static IDProperty*IDP_CopyProperty_ex(const IDProperty*,int);
static IDProperty*IDP_CopyProperty(const IDProperty*);
static IDProperty*IDP_CopyString(const IDProperty*,int){std::abort();}
static IDProperty*IDP_CopyID(const IDProperty*,int){std::abort();}
static IDProperty*IDP_CopyArray(const IDProperty*,int){std::abort();}
static IDProperty*IDP_CopyIDPArray(const IDProperty*,int){std::abort();}
static void IDP_FreeProperty(IDProperty*p){assert(!p->data.group.first&&!p->data.group.last);MEM_freeN(p);}
static void WM_operator_properties_free(PointerRNA*p){if(p->data)IDP_FreeProperty(static_cast<IDProperty*>(p->data));p->data=nullptr;}
static int RNA_property_type(PropertyRNA*p){return p->type;}
static StructRNA*RNA_property_pointer_type(PointerRNA*,PropertyRNA*){std::abort();}
static bool RNA_struct_is_a(StructRNA*a,StructRNA*b){return a==b;}
static PointerRNA RNA_property_pointer_get(PointerRNA*,PropertyRNA*){std::abort();}
static void RNA_def_property_clear_flag(PropertyRNA*p,int f){p->flag&=~f;}
static std::vector<PropertyRNA*>scalar_only_schema;
#define RNA_STRUCT_BEGIN(ptr,prop) for(PropertyRNA*prop:scalar_only_schema){
#define RNA_STRUCT_END }
enum {PROP_BOOLEAN,PROP_INT,PROP_FLOAT,PROP_STRING,PROP_ENUM,PROP_POINTER,PROP_COLLECTION};
enum{PROP_ENUM_NO_CONTEXT=1<<20};
void WM_operator_properties_create(PointerRNA*,const char*);
static void WM_keymap_clear(wmKeyMap*);
static void BLI_freelinkN(ListBase*,void*);
static wmKeyMap*WM_keymap_list_find(ListBase*,const char*,int,int);
static void WM_keyconfig_update_tag(wmKeyMap*,wmKeyMapItem*);
static wmKeyMapItem*wm_keymap_find_item_equals(wmKeyMap*,wmKeyMapItem*){std::abort();}
static wmKeyMapItem*wm_keymap_find_item_equals_result(wmKeyMap*,wmKeyMapItem*){std::abort();}
static void wm_keymap_addon_add(wmKeyMap*,wmKeyMap*){std::abort();}
static void wm_keymap_patch(wmKeyMap*,wmKeyMap*){std::abort();}
static wmKeyMap*WM_modalkeymap_ensure(wmKeyConfig*,const char*,const void*){std::abort();}
static int WM_userdef_event_map(int t){return t;}
struct WorkSpace{};static const WorkSpace*CTX_wm_workspace(bContext*){return nullptr;}
static bool BKE_workspace_owner_id_check(const WorkSpace*,const char*){return true;}
struct bToolRef{char idname[64]{};};
