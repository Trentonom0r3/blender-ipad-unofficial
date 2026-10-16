
#include <cassert>
#include <cstdio>
#define BLI_assert(v) assert(v)
struct Main {};
struct Scene {};
struct bContext { struct { Main *main; Scene *scene; } data; };
enum { CTX_RESULT_OK=1, CTX_DATA_TYPE_POINTER=1 };
struct bContextDataResult { int type; struct { void *data; } ptr; };
static int provider_calls=0;
static int ctx_data_get(bContext *,const char *,bContextDataResult *) {
  ++provider_calls; assert(false && "null context must not query a provider"); return 0;
}

static bool ctx_data_pointer_verify(const bContext *C, const char *member, void **pointer)
{
  /* if context is nullptr, pointer must be nullptr too and that is a valid return */
  if (C == nullptr) {
    *pointer = nullptr;
    return true;
  }

  bContextDataResult result;
  if (ctx_data_get((bContext *)C, member, &result) == CTX_RESULT_OK) {
    BLI_assert(result.type == CTX_DATA_TYPE_POINTER);
    *pointer = result.ptr.data;
    return true;
  }

  *pointer = nullptr;
  return false;
}
Main *CTX_data_main(const bContext *C)
{
  Main *bmain;
  if (ctx_data_pointer_verify(C, "blend_data", (void **)&bmain)) {
    return bmain;
  }

  return C->data.main;
}
Scene *CTX_data_scene(const bContext *C)
{
  Scene *scene;
  if (ctx_data_pointer_verify(C, "scene", (void **)&scene)) {
    return scene;
  }

  return C->data.scene;
}

int main() {
  int sentinel=1; void *output=&sentinel;
  assert(ctx_data_pointer_verify(nullptr,"unused",&output));
  assert(output==nullptr);
  assert(CTX_data_main(nullptr)==nullptr);
  assert(CTX_data_scene(nullptr)==nullptr);
  assert(provider_calls==0);
  std::puts("PASS exact pinned null-context verify/Main/Scene: no provider dispatch");
}
