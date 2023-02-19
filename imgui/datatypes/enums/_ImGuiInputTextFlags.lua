---@meta

---@enum ImGuiInputTextFlags
ImGuiInputTextFlags = {
  None                = 0,
  CharsDecimal        = 1,   -- Allow 0123456789.+-*/
  CharsHexadecimal    = 2,   -- Allow 0123456789ABCDEFabcdef
  CharsUppercase      = 4,   -- Turn a..z into A..Z
  CharsNoBlank        = 8,   -- Filter out spaces, tabs
  AutoSelectAll       = 16,   -- Select entire text when first taking mouse focus
  EnterReturnsTrue    = 32,   -- Return 'true' when Enter is pressed (as opposed to every time the value was modified). Consider looking at the IsItemDeactivatedAfterEdit() function.
  CallbackCompletion  = 64,   -- Callback on pressing TAB (for completion handling)
  CallbackHistory     = 128,   -- Callback on pressing Up/Down arrows (for history handling)
  CallbackAlways      = 256,   -- Callback on each iteration. User code may query cursor position, modify text buffer.
  CallbackCharFilter  = 512,   -- Callback on character inputs to replace or discard them. Modify 'EventChar' to replace or discard, or return 1 in callback to discard.
  AllowTabInput       = 1024,  -- Pressing TAB input a '\t' character into the text field
  CtrlEnterForNewLine = 2048,  -- In multi-line mode, unfocus with Enter, add new line with Ctrl+Enter (default is opposite: unfocus with Ctrl+Enter, add line with Enter).
  NoHorizontalScroll  = 4096,  -- Disable following the cursor horizontally
  AlwaysOverwrite     = 8192,  -- Overwrite mode
  ReadOnly            = 16384,  -- Read-only mode
  Password            = 32768,  -- Password mode, display all characters as '*'
  NoUndoRedo          = 65536,  -- Disable undo/redo. Note that input text owns the text data while active, if you want to provide your own undo/redo stack you need e.g. to call ClearActiveID().
  CharsScientific     = 131072,  -- Allow 0123456789.+-*/eE (Scientific notation input)
  CallbackResize      = 262144,  -- Callback on buffer capacity changes request (beyond 'buf_size' parameter value), allowing the string to grow. Notify when the string wants to be resized (for string types which hold a cache of their Size). You will be provided a new BufSize in the callback and NEED to honor it. (see misc/cpp/imgui_stdlib.h for an example of using this)
  CallbackEdit        = 524288   -- Callback on any edit (note that InputText() already returns true on edit, the callback is useful mainly to manipulate the underlying buffer while focus is active)
}