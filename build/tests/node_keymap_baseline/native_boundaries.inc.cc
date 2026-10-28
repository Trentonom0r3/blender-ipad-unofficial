// Explicit portable boundaries: guarded allocator -> tracked malloc/new; RNA schema
// storage -> vectors; registered operator registry -> map. Native algorithms follow.
#include <algorithm>
#include <cassert>
#include <cctype>
#include <cfloat>
#include <climits>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <map>
#include <memory>
#include <set>
#include <string>
#include <vector>
#define BLI_assert assert
#define BLI_INLINE inline
#define STREQ(a,b) (std::strcmp(a,b)==0)
#define STREQLEN(a,b,n) (std::strncmp(a,b,n)==0)
#define STRNCPY(a,b) do { std::snprintf(a,sizeof(a),"%s",b); } while(0)
#define STRNCPY_UTF8 STRNCPY
#define LISTBASE_FOREACH(T,v,lb) for(T v=static_cast<T>((lb)->first);v;v=v->next)
#define LISTBASE_FOREACH_MUTABLE(T,v,lb) for(auto v=static_cast<T>((lb)->first),v##_next=v?v->next:nullptr;v;v=v##_next,v##_next=v?v->next:nullptr)
#define KMI_PARAMS_MOD_TO_ANY(mod) ((mod)<<8)
#define KMI_PARAMS_MOD_FROM_ANY(mod) ((mod)>>8)
#define KM_MOD_HELD 1
#define OP_MAX_TYPENAME 64
#define KMAP_MAX_NAME 64
#define DEFAULT_ALLOC_FOR_NULL_STRINGS 64
#define RPT_ERROR 1
#define CLOG_ERROR(...) std::abort()
template<typename T,typename... U> bool elem(T a,U...b){return ((a==b)||...);}
#define ELEM(...) elem(__VA_ARGS__)
namespace blender {
struct StringRef {const char* p;StringRef(const char*p):p(p){} template<size_t N>void copy_utf8_truncated(char(&out)[N])const{std::snprintf(out,N,"%s",p);}};
template<class T,int N=0> struct Vector:std::vector<T>{using std::vector<T>::vector;Vector()=default;Vector(const std::vector<T>&v):std::vector<T>(v){}bool is_empty()const{return this->empty();}T& last(){return this->back();}const T& last()const{return this->back();}void append(T x){this->push_back(x);}};
template<class T> using Span=std::vector<T>;
}
using blender::StringRef;
static std::map<void*,size_t> allocations;
static int calloc_calls=0,new_calls=0,dup_calls=0,sanitize_visits=0,refine_calls=0;
static void* allocate(size_t n,bool clear){void*p=clear?std::calloc(1,n):std::malloc(n);assert(p);allocations[p]=n;return p;}
template<class T>T* MEM_callocN(const char*){++calloc_calls;return static_cast<T*>(allocate(sizeof(T),true));}
template<class T>T* MEM_new(const char*){++new_calls;return new T();}
static void* MEM_dupallocN(const void*p){if(!p)return nullptr;++dup_calls;auto n=allocations.at(const_cast<void*>(p));void*q=allocate(n,false);std::memcpy(q,p,n);return q;}
static void* MEM_calloc_arrayN(size_t,size_t,const char*){std::abort();}
template<class T>T* MEM_malloc_arrayN(size_t,const char*){std::abort();}
static void MEM_freeN(void*p){allocations.erase(p);std::free(p);}
template<class T>void MEM_delete(T*p){delete p;}
struct ID{};struct IDPropertyUIData{};struct bContext{};struct wmOperator{};struct ReportList{};
static void BKE_report(ReportList*,int,const char*){std::abort();}
static void BKE_reportf(ReportList*,int,const char*){std::abort();}
static const char* RNA_struct_state_owner_get(){return nullptr;}
