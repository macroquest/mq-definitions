---@meta actors

---@class Actors
actors = {}

-- registers an actor and sets the message callback
---@param name string # The name of the mailbox
---@param message_handler fun(message: Message) # The lua function message handler 
---@return Dropbox # The dropbox interface to the actor
---@overload fun(message_handler: fun(message: Message)): Dropbox # An overload that registers the script actor
function actors.register(name, message_handler) end

-- The send method to send a message to an actor anonymously
---@param address Address # The address to send to
---@param payload any # The message content
---@param response_callback fun(status: integer, message: Message) # The response callback for RPC messages
---@overload fun(address: Address, payload: any) # Send an addressed non-RPC message
---@overload fun(payload: any, response_callback: fun(status: integer, message: Message)) # Send an RPC message to all script actors with the same script
---@overload fun(payload: any) # Send a non-RPC message to all script actors with the same script
function actors.send(address, payload, response_callback) end

---@enum actors.ResponseStatus
actors.ResponseStatus = {
    ConnectionClosed =   -1, -- Connection was closed during send
    NoConnection =       -2, -- Connection could not be found
    RoutingFailed =      -3, -- Could not find a way to route message to any recipient
    AmbiguousRecipient = -4, -- Message could not be routed to a single recipient
}

---@class Address
---@field public mailbox? string # The mailbox of the actor
---@field public script? string # The script the actor is in
---@field public pid? integer # The windows process ID
---@field public name? string # A standalone application registered name
---@field public account? string # The account of the target client
---@field public server? string # The server shortname of the target client
---@field public character? string # The character name of the target client
---@field public absolute_mailbox? boolean # Used if the target actor is outside of lua
address = {}

---@class Message
---@field public content any # The message content, can be a table or any primitive
---@field public sender Address # The address of the sender
message = {}

-- replies to an RPC message to be handled by the sender's response callback
---@param status integer # The message status integer
---@param payload any # The content of the message being sent back
---@overload fun(payload: any) # Overload that defaults status to 0
function message:reply(status, payload) end

-- sends a message back to the sender to be handled by the sender's message handler
---@param payload any # The content of the message being sent back
function message:send(payload) end

---@class Dropbox
dropbox = {}

-- The send method to send a message from one actor to another
---@param address Address # The address to send to
---@param payload any # The message content
---@param response_callback fun(status: integer, message: Message) # The response callback for RPC messages
---@overload fun(address: Address, payload: any) # Send an addressed non-RPC message
---@overload fun(payload: any, response_callback: fun(status: integer, message: Message)) # Send an RPC message to all actors with the same mailbox
---@overload fun(payload: any) # Send a non-RPC message to all actors with the same mailbox
function dropbox:send(address, payload, response_callback) end

-- The unregister method to remove the actor from the central post office
function dropbox:unregister() end

return actors
