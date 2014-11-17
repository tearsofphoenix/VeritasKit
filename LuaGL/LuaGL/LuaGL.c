//
//  LuaGL.m
//  LuaGL
//
//  Created by Mac003 on 14/11/17.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#include "LuaGL.h"
#include "luagl_util.h"
#include <string.h>
#include <stdlib.h>
#include <OpenGLES/ES3/gl.h>


static int lua_glActiveTexture(lua_State *L)
{
    GLenum texture = (int)lua_tointeger(L, 1);
    glActiveTexture(texture);
    return 0;
}

static int lua_glAttachShader(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    GLuint shader = (int)lua_tointeger(L, 2);
    glAttachShader(program, shader);
    return 0;
}

static int lua_glBindAttribLocation(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    GLuint index = (int)lua_tointeger(L, 2);
    const GLchar* name = lua_tostring(L, 3);
    
    glBindAttribLocation(program, index, name);
    return 0;
}

static int lua_glBindBuffer(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLuint buffer = (int)lua_tointeger(L, 2);
    glBindBuffer(target, buffer);
    return 0;
}

static int lua_glBindFramebuffer(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLuint framebuffer = (int)lua_tointeger(L, 2);
    glBindFramebuffer(target, framebuffer);
    return 0;
}

static int lua_glBindRenderbuffer(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLuint renderbuffer = (int)lua_tointeger(L, 2);
    glBindRenderbuffer(target, renderbuffer);
    return 0;
}

static int lua_glBindTexture(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLuint texture = (int)lua_tointeger(L, 2);
    glBindTexture(target, texture);
    return 0;
}

static int lua_glBlendColor(lua_State *L)
{
    GLfloat red = lua_tonumber(L, 1);
    GLfloat green = lua_tonumber(L, 2);
    GLfloat blue = lua_tonumber(L, 3);
    GLfloat alpha = lua_tonumber(L, 4);
    glBlendColor(red, green, blue, alpha);
    return 0;
}

static int lua_glBlendEquation(lua_State *L)
{
    GLenum mode = (int)lua_tointeger(L, 1);
    glBlendEquation(mode);
    return 0;
}

static int lua_glBlendEquationSeparate(lua_State *L)
{
    GLenum modeRGB = (int)lua_tointeger(L, 1);
    GLenum modeAlpha = (int)lua_tointeger(L, 2);
    glBlendEquationSeparate(modeRGB, modeAlpha);
    return 0;
}

static int lua_glBlendFunc(lua_State *L)
{
    GLenum sfactor = (int)lua_tointeger(L, 1);
    GLenum dfactor = (int)lua_tointeger(L, 2);
    glBlendFunc(sfactor, dfactor);
    return 0;
}

static int lua_glBlendFuncSeparate(lua_State *L)
{
    GLenum srcRGB = (int)lua_tointeger(L, 1);
    GLenum dstRGB = (int)lua_tointeger(L, 2);
    GLenum srcAlpha = (int)lua_tointeger(L, 3);
    GLenum dstAlpha = (int)lua_tointeger(L, 4);
    glBlendFuncSeparate(srcRGB, dstRGB, srcAlpha, dstAlpha);
    return 0;
}

static int lua_glBufferData(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    const GLvoid *data = lua_tostring(L, 2);
    GLsizeiptr size = strlen(data);
    GLenum usage = (int)lua_tointeger(L, 3);
    glBufferData(target, size, data, usage);
    return 0;
}

static int lua_glBufferSubData(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLintptr offset = lua_tointeger(L, 2);
    const GLvoid *data = lua_tostring(L, 3);
    GLsizeiptr size = strlen(data);
    glBufferSubData(target, offset, size, data);
    return 0;
}

static int lua_glCheckFramebufferStatus(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLenum ret = glCheckFramebufferStatus(target);
    lua_pushinteger(L, ret);
    return 1;
}

static int lua_glClear(lua_State *L)
{
    GLbitfield mask = (int)lua_tointeger(L, 1);
    glClear(mask);
    return 0;
}

static int lua_glClearColor(lua_State *L)
{
    GLfloat red = lua_tonumber(L, 1);
    GLfloat green = lua_tonumber(L, 2);
    GLfloat blue = lua_tonumber(L, 3);
    GLfloat alpha = lua_tonumber(L, 4);
    glClearColor(red, green, blue, alpha);
    return 0;
}

static int lua_glClearDepthf(lua_State *L)
{
    GLclampf depth = lua_tonumber(L, 1);
    glClearDepthf(depth);
    return 0;
}

static int lua_glClearStencil(lua_State *L)
{
    GLint s = (int)lua_tointeger(L, 1);
    glClearStencil(s);
    return 0;
}

static int lua_glColorMask(lua_State *L)
{
    GLboolean red = (int)lua_tointeger(L, 1);
    GLboolean green = (int)lua_tointeger(L, 2);
    GLboolean blue = (int)lua_tointeger(L, 3);
    GLboolean alpha = (int)lua_tointeger(L, 4);
    glColorMask(red, green, blue, alpha);
    return 0;
}

static int lua_glCompileShader(lua_State *L)
{
    GLuint shader = (int)lua_tointeger(L, 1);
    glCompileShader(shader);
    return 0;
}

static int lua_glCompressedTexImage2D(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLint level = (int)lua_tointeger(L, 2);
    GLenum internalformat = (int)lua_tointeger(L, 3);
    GLsizei width = (int)lua_tointeger(L, 4);
    GLsizei height = (int)lua_tointeger(L, 5);
    GLint border = (int)lua_tointeger(L, 6);
    GLsizei imageSize = (int)lua_tointeger(L, 7);
    const GLvoid *data = lua_tostring(L, 8);

    glCompressedTexImage2D(target, level, internalformat, width, height, border, imageSize, data);
    return 0;
}

static int lua_glCompressedTexSubImage2D(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLint level = (int)lua_tointeger(L, 2);
    GLint xoffset = (int)lua_tointeger(L, 3);
    GLint yoffset = (int)lua_tointeger(L, 4);
    GLsizei width = (int)lua_tointeger(L, 5);
    GLsizei height = (int)lua_tointeger(L, 6);
    GLenum format = (int)lua_tointeger(L, 7);
    GLsizei imageSize = (int)lua_tointeger(L, 8);
    const GLvoid *data = lua_tostring(L, 9);

    glCompressedTexSubImage2D(target, level, xoffset, yoffset, width, height, format, imageSize, data);
    return 0;
}

static int lua_glCopyTexImage2D(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLint level = (int)lua_tointeger(L, 2);
    GLenum internalformat = (int)lua_tointeger(L, 3);
    GLint x = (int)lua_tointeger(L, 4);
    GLint y = (int)lua_tointeger(L, 5);
    GLsizei width = (int)lua_tointeger(L, 6);
    GLsizei height = (int)lua_tointeger(L, 7);
    GLint border = (int)lua_tointeger(L, 8);
    glCopyTexImage2D(target, level, internalformat, x, y, width, height, border);
    return 0;
}

static int lua_glCopyTexSubImage2D(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLint level = (int)lua_tointeger(L, 2);
    GLint xoffset = (int)lua_tointeger(L, 3);
    GLint yoffset = (int)lua_tointeger(L, 4);
    GLint x = (int)lua_tointeger(L, 5);
    GLint y = (int)lua_tointeger(L, 6);
    GLsizei width = (int)lua_tointeger(L, 7);
    GLsizei height = (int)lua_tointeger(L, 8);
    glCopyTexSubImage2D(target, level, xoffset, yoffset, x, y, width, height);
    return 0;
}

static int lua_glCreateProgram(lua_State *L)
{
    glCreateProgram();
    GLuint ret = glCreateProgram();
    lua_pushinteger(L, ret);
    return 1;
}

static int lua_glCreateShader(lua_State *L)
{
    GLenum type = (int)lua_tointeger(L, 1);
    GLuint ret = glCreateShader(type);
    lua_pushinteger(L, ret);
    return 1;
}

static int lua_glCullFace(lua_State *L)
{
    GLenum mode = (int)lua_tointeger(L, 1);
    glCullFace(mode);
    return 0;
}

static int lua_glDeleteBuffers(lua_State *L)
{
    //TODO
    luaL_checktype(L, 1, LUA_TTABLE);
    GLsizei n = (GLsizei)lua_rawlen(L, 1);
    GLuint *buffers = malloc(n * sizeof(GLuint));
    for (int i = 1; i <= n; ++i)
    {
        lua_rawgeti(L, 1, i);
        buffers[i - 1] = (GLuint)lua_tointeger(L, i);
    }
    
    glDeleteBuffers(n, buffers);
    
    free(buffers);
    
    return 0;
}

static int lua_glDeleteFramebuffers(lua_State *L)
{
    //TODO

    return 0;
}

static int lua_glDeleteProgram(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    glDeleteProgram(program);
    return 0;
}

static int lua_glDeleteRenderbuffers(lua_State *L)
{
    //TODO
    
    return 0;
}

static int lua_glDeleteShader(lua_State *L)
{
    GLuint shader = (int)lua_tointeger(L, 1);
    glDeleteShader(shader);
    return 0;
}

static int lua_glDeleteTextures(lua_State *L)
{
    //TODO
    
    return 0;
}

static int lua_glDepthFunc(lua_State *L)
{
    GLenum func = (int)lua_tointeger(L, 1);
    glDepthFunc(func);
    return 0;
}

static int lua_glDepthMask(lua_State *L)
{
    GLboolean flag = (int)lua_tointeger(L, 1);
    glDepthMask(flag);
    return 0;
}

static int lua_glDepthRangef(lua_State *L)
{
    GLclampf zNear = lua_tonumber(L, 1);
    GLclampf zFar = lua_tonumber(L, 2);
    glDepthRangef(zNear, zFar);
    return 0;
}

static int lua_glDetachShader(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    GLuint shader = (int)lua_tointeger(L, 2);
    glDetachShader(program, shader);
    return 0;
}

static int lua_glDisable(lua_State *L)
{
    GLenum cap = (int)lua_tointeger(L, 1);
    glDisable(cap);
    return 0;
}

static int lua_glDisableVertexAttribArray(lua_State *L)
{
    GLuint index = (int)lua_tointeger(L, 1);
    glDisableVertexAttribArray(index);
    return 0;
}

static int lua_glDrawArrays(lua_State *L)
{
    GLenum mode = (int)lua_tointeger(L, 1);
    GLint first = (int)lua_tointeger(L, 2);
    GLsizei count = (int)lua_tointeger(L, 3);
    glDrawArrays(mode, first, count);
    return 0;
}

static int lua_glDrawElements(lua_State *L)
{
    //TODO
    GLenum mode = (int)lua_tointeger(L, 1);
    GLsizei count = (int)lua_tointeger(L, 2);
    GLenum type = (int)lua_tointeger(L, 3);
    const GLvoid *indices = lua_touserdata(L, 4);
    
    glDrawElements(mode, count, type, indices);
    return 0;
}

static int lua_glEnable(lua_State *L)
{
    GLenum cap = (int)lua_tointeger(L, 1);
    glEnable(cap);
    return 0;
}

static int lua_glEnableVertexAttribArray(lua_State *L)
{
    GLuint index = (int)lua_tointeger(L, 1);
    glEnableVertexAttribArray(index);
    return 0;
}

static int lua_glFinish(lua_State *L)
{
    glFinish();
    return 0;
}

static int lua_glFlush(lua_State *L)
{
    glFlush();
    return 0;
}

static int lua_glFramebufferRenderbuffer(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLenum attachment = (int)lua_tointeger(L, 2);
    GLenum renderbuffertarget = (int)lua_tointeger(L, 3);
    GLuint renderbuffer = (int)lua_tointeger(L, 4);
    glFramebufferRenderbuffer(target, attachment, renderbuffertarget, renderbuffer);
    return 0;
}

static int lua_glFramebufferTexture2D(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLenum attachment = (int)lua_tointeger(L, 2);
    GLenum textarget = (int)lua_tointeger(L, 3);
    GLuint texture = (int)lua_tointeger(L, 4);
    GLint level = (int)lua_tointeger(L, 5);
    glFramebufferTexture2D(target, attachment, textarget, texture, level);
    return 0;
}

static int lua_glFrontFace(lua_State *L)
{
    GLenum mode = (int)lua_tointeger(L, 1);
    glFrontFace(mode);
    return 0;
}

static int lua_glGenBuffers(lua_State *L)
{
    GLsizei n = (GLsizei)luaL_checkinteger(L, 1);
    GLuint *buffers = LUAGL_NEW_ARRAY(GLuint, n);
    
    glGenBuffers(n, buffers);
    
    luagl_push_arrayui(L, buffers, n);
    
    LUAGL_DELETE_ARRAY(buffers);
    
    return 1;
}

static int lua_glGenerateMipmap(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    glGenerateMipmap(target);
    return 0;
}

static int lua_glGenFramebuffers(lua_State *L)
{
    GLsizei n = (GLsizei)luaL_checkinteger(L, 1);
    GLuint *framebuffers = LUAGL_NEW_ARRAY(GLuint, n);
    
    glGenFramebuffers(n, framebuffers);
    
    luagl_push_arrayui(L, framebuffers, n);
    
    LUAGL_DELETE_ARRAY(framebuffers);
    
    return 1;
}

static int lua_glGenRenderbuffers(lua_State *L)
{
    GLsizei n = (GLsizei)luaL_checkinteger(L, 1);
    GLuint *renderbuffers = LUAGL_NEW_ARRAY(GLuint, n);
    
    glGenRenderbuffers(n, renderbuffers);
    luagl_push_arrayui(L, renderbuffers, n);
    LUAGL_DELETE_ARRAY(renderbuffers);
    
    return 1;
}

static int lua_glGenTextures(lua_State *L)
{
    GLsizei n = (GLsizei)luaL_checkinteger(L, 1);
    GLuint *textures = LUAGL_NEW_ARRAY(GLuint, n);
    
    glGenTextures(n, textures);
    luagl_push_arrayui(L, textures, n);
    LUAGL_DELETE_ARRAY(textures);
    
    return 1;
}

static int lua_glGetActiveAttrib(lua_State *L)
{
    //TODO
    GLuint program = (int)lua_tointeger(L, 1);
    GLuint index = (int)lua_tointeger(L, 2);
    GLsizei bufsize = (int)lua_tointeger(L, 3);
    GLsizei length = 0;
    GLint size = 0;
    GLenum type = 0;
    GLchar *name = malloc(bufsize * sizeof(GLchar));
    
    glGetActiveAttrib(program, index, bufsize, &length, &size, &type, name);
    
    switch (type)
    {
        case GL_FLOAT:
        {
            break;
        }
        case GL_FLOAT_VEC2:
        {
            break;
        }
            case GL_FLOAT_VEC3:
        {
            break;
        }
        case GL_FLOAT_VEC4:
        {
            break;
        }
        case GL_FLOAT_MAT2:
        {
            break;
        }
        case GL_FLOAT_MAT3:
        {
            break;
        }
        case GL_FLOAT_MAT4:
        {
            break;
        }
        default:
            break;
    }

    free(name);
    
    return 0;
}

static int lua_glGetActiveUniform(lua_State *L)
{
    //TODO
    GLuint program = (int)lua_tointeger(L, 1);
    GLuint index = (int)lua_tointeger(L, 2);
    GLsizei bufsize = (int)lua_tointeger(L, 3);
    GLsizei length = 0;
    GLint size = 0;
    GLenum type = 0;
    GLchar *name = malloc(bufsize * sizeof(GLchar));

    glGetActiveUniform(program, index, bufsize, &length, &size, &type, name);
    
    return 0;
}

static int lua_glGetAttachedShaders(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    GLsizei maxcount = (GLsizei)lua_tointeger(L, 2) ?: 256;
    GLuint *shaders = LUAGL_NEW_ARRAY(GLuint, maxcount);

    glGetAttachedShaders(program, maxcount, &maxcount, shaders);
    luagl_push_arrayui(L, shaders, maxcount);
    LUAGL_DELETE_ARRAY(shaders);
    return 1;
}

static int lua_glGetAttribLocation(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    const GLchar *name = lua_tostring(L, 2);
    int ret = glGetAttribLocation(program, name);
    lua_pushinteger(L, ret);
    return 1;
}

static int lua_glGetBooleanv(lua_State *L)
{
    GLenum pname = (int)lua_tointeger(L, 1);
    GLboolean params = 0;
    glGetBooleanv(pname, &params);
    lua_pushinteger(L, params);
    return 1;
}

static int lua_glGetBufferParameteriv(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    if (!(GL_ARRAY_BUFFER == target
        || GL_ELEMENT_ARRAY_BUFFER == target)
        )
    {
        luaL_error(L, "Invalid target type: %ld for glGetBufferParameteriv", target);
    }
    
    GLenum pname = (int)lua_tointeger(L, 2);
    if (!(GL_BUFFER_SIZE == pname
          || GL_BUFFER_USAGE == pname)
        )
    {
        luaL_error(L, "Invalid pname type: %ld for glGetBufferParameteriv", pname);
    }
    
    GLint params = 0;
    glGetBufferParameteriv(target, pname, &params);
    lua_pushinteger(L, params);
    return 1;
}

static int lua_glGetError(lua_State *L)
{
    GLenum ret = glGetError();
    lua_pushinteger(L, ret);
    return 1;
}

static int lua_glGetFloatv(lua_State *L)
{
    GLenum pname = (int)lua_tointeger(L, 1);
    GLfloat params = 0;
    glGetFloatv(pname, &params);
    lua_pushnumber(L, params);
    return 1;
}

static int lua_glGetFramebufferAttachmentParameteriv(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    if (GL_FRAMEBUFFER != target)
    {
        luaL_error(L, "Invalid target : %ld for glGetFramebufferAttachmentParameteriv", target);
    }
    
    GLenum attachment = (int)lua_tointeger(L, 2);
    switch (attachment)
    {
        case GL_COLOR_ATTACHMENT0:
        case GL_DEPTH_ATTACHMENT:
        case GL_STENCIL_ATTACHMENT:
            break;
        default:
        {
            luaL_error(L, "Invalid attachment: %ld for glGetFramebufferAttachmentParameteriv.", attachment);
            break;
        }
    }

    GLenum pname = (int)lua_tointeger(L, 3);
    switch (pname)
    {
        case GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE:
        case GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME:
        case GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL:
        case GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE:
        {
            break;
        }
        default:
        {
            luaL_error(L, "Invalid pnam: %ld for glGetFramebufferAttachmentParameteriv", pname);
            break;
        }
    }
    
    GLint params = 0;
    glGetFramebufferAttachmentParameteriv(target, attachment, pname, &params);
    lua_pushinteger(L, params);
    
    return 1;
}

static int lua_glGetIntegerv(lua_State *L)
{
    GLenum pname = (int)lua_tointeger(L, 1);
    GLint params = 0;
    glGetIntegerv(pname, &params);
    lua_pushinteger(L, params);
    return 1;
}

static int lua_glGetProgramiv(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    GLint params = 0;

    glGetProgramiv(program, pname, &params);
    lua_pushinteger(L, params);
    return 1;
}

static int lua_glGetProgramInfoLog(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    GLint length = 0;
    glGetProgramiv(program, GL_INFO_LOG_LENGTH, &length);
    GLsizei bufsize = length * sizeof(GLchar);
    GLchar *infolog = malloc(bufsize);
    
    glGetProgramInfoLog(program, bufsize, &length, infolog);
    lua_pushstring(L, infolog);
    
    free(infolog);
    
    return 1;
}

static int lua_glGetRenderbufferParameteriv(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    glGetRenderbufferParameteriv(target, pname, params);
    return 0;
}

static int lua_glGetShaderiv(lua_State *L)
{
    GLuint shader = (int)lua_tointeger(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    glGetShaderiv(shader, pname, params);
    return 0;
}

static int lua_glGetShaderInfoLog(lua_State *L)
{
    GLuint shader = (int)lua_tointeger(L, 1);
    GLsizei bufsize = (int)lua_tointeger(L, 2);
    glGetShaderInfoLog(shader, bufsize, length, infolog);
    return 0;
}

static int lua_glGetShaderPrecisionFormat(lua_State *L)
{
    GLenum shadertype = (int)lua_tointeger(L, 1);
    GLenum precisiontype = (int)lua_tointeger(L, 2);
    glGetShaderPrecisionFormat(shadertype, precisiontype, range, precision);
    return 0;
}

static int lua_glGetShaderSource(lua_State *L)
{
    GLuint shader = (int)lua_tointeger(L, 1);
    GLsizei bufsize = (int)lua_tointeger(L, 2);
    glGetShaderSource(shader, bufsize, length, source);
    return 0;
}

static int lua_glGetString(lua_State *L)
{
    GLenum name = (int)lua_tointeger(L, 1);
    const GLubyte* ret = glGetString(name);
    lua_pushstring(L, ret);
    return 1;
}

static int lua_glGetTexParameterfv(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    glGetTexParameterfv(target, pname, params);
    return 0;
}

static int lua_glGetTexParameteriv(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    glGetTexParameteriv(target, pname, params);
    return 0;
}

static int lua_glGetUniformfv(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    GLint location = (int)lua_tointeger(L, 2);
    glGetUniformfv(program, location, params);
    return 0;
}

static int lua_glGetUniformiv(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    GLint location = (int)lua_tointeger(L, 2);
    glGetUniformiv(program, location, params);
    return 0;
}

static int lua_glGetUniformLocation(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    const GLchar *name = lua_tostring(L, 2);
    
    int ret = glGetUniformLocation(program, name);
    lua_pushinteger(L, ret);
    return 1;
}

static int lua_glGetVertexAttribfv(lua_State *L)
{
    GLuint index = (int)lua_tointeger(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    glGetVertexAttribfv(index, pname, params);
    return 0;
}

static int lua_glGetVertexAttribiv(lua_State *L)
{
    GLuint index = (int)lua_tointeger(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    glGetVertexAttribiv(index, pname, params);
    return 0;
}

static int lua_glGetVertexAttribPointerv(lua_State *L)
{
    GLuint index = (int)lua_tointeger(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    glGetVertexAttribPointerv(index, pname, pointer);
    return 0;
}

static int lua_glHint(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLenum mode = (int)lua_tointeger(L, 2);
    glHint(target, mode);
    return 0;
}

static int lua_glIsBuffer(lua_State *L)
{
    GLuint buffer = (int)lua_tointeger(L, 1);
    GLboolean ret = glIsBuffer(buffer);
    lua_pushinteger(L, ret);
    return 1;
}

static int lua_glIsEnabled(lua_State *L)
{
    GLenum cap = (int)lua_tointeger(L, 1);
    GLboolean ret = glIsEnabled(cap);
    lua_pushinteger(L, ret);
    return 1;
}

static int lua_glIsFramebuffer(lua_State *L)
{
    GLuint framebuffer = (int)lua_tointeger(L, 1);
    GLboolean ret = glIsFramebuffer(framebuffer);
    lua_pushinteger(L, ret);
    return 1;
}

static int lua_glIsProgram(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    GLboolean ret = glIsProgram(program);
    lua_pushinteger(L, ret);
    return 1;
}

static int lua_glIsRenderbuffer(lua_State *L)
{
    GLuint renderbuffer = (int)lua_tointeger(L, 1);
    GLboolean ret = glIsRenderbuffer(renderbuffer);
    lua_pushinteger(L, ret);
    return 1;
}

static int lua_glIsShader(lua_State *L)
{
    GLuint shader = (int)lua_tointeger(L, 1);
    GLboolean ret = glIsShader(shader);
    lua_pushinteger(L, ret);
    return 1;
}

static int lua_glIsTexture(lua_State *L)
{
    GLuint texture = (int)lua_tointeger(L, 1);
    GLboolean ret = glIsTexture(texture);
    lua_pushinteger(L, ret);
    return 1;
}

static int lua_glLineWidth(lua_State *L)
{
    GLfloat width = lua_tonumber(L, 1);
    glLineWidth(width);
    return 0;
}

static int lua_glLinkProgram(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    glLinkProgram(program);
    return 0;
}

static int lua_glPixelStorei(lua_State *L)
{
    GLenum pname = (int)lua_tointeger(L, 1);
    GLint param = (int)lua_tointeger(L, 2);
    glPixelStorei(pname, param);
    return 0;
}

static int lua_glPolygonOffset(lua_State *L)
{
    GLfloat factor = lua_tonumber(L, 1);
    GLfloat units = lua_tonumber(L, 2);
    glPolygonOffset(factor, units);
    return 0;
}

static int lua_glReadPixels(lua_State *L)
{
    GLint x = (int)lua_tointeger(L, 1);
    GLint y = (int)lua_tointeger(L, 2);
    GLsizei width = (int)lua_tointeger(L, 3);
    GLsizei height = (int)lua_tointeger(L, 4);
    GLenum format = (int)lua_tointeger(L, 5);
    GLenum type = (int)lua_tointeger(L, 6);
    GLvoid* pixels = lua_tostring(L, 7);
    glReadPixels(x, y, width, height, format, type, pixels);
    return 0;
}

static int lua_glReleaseShaderCompiler(lua_State *L)
{
    glReleaseShaderCompiler();
    glReleaseShaderCompiler();
    return 0;
}

static int lua_glRenderbufferStorage(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLenum internalformat = (int)lua_tointeger(L, 2);
    GLsizei width = (int)lua_tointeger(L, 3);
    GLsizei height = (int)lua_tointeger(L, 4);
    glRenderbufferStorage(target, internalformat, width, height);
    return 0;
}

static int lua_glSampleCoverage(lua_State *L)
{
    GLclampf value = lua_tonumber(L, 1);
    GLboolean invert = (int)lua_tointeger(L, 2);
    glSampleCoverage(value, invert);
    return 0;
}

static int lua_glScissor(lua_State *L)
{
    GLint x = (int)lua_tointeger(L, 1);
    GLint y = (int)lua_tointeger(L, 2);
    GLsizei width = (int)lua_tointeger(L, 3);
    GLsizei height = (int)lua_tointeger(L, 4);
    glScissor(x, y, width, height);
    return 0;
}

static int lua_glShaderBinary(lua_State *L)
{
    GLsizei n = (int)lua_tointeger(L, 1);
    GLenum binaryformat = (int)lua_tointeger(L, 3);
    GLsizei length = (int)lua_tointeger(L, 5);
    glShaderBinary(n, shaders, binaryformat, binary, length);
    return 0;
}

static int lua_glShaderSource(lua_State *L)
{
    GLuint shader = (int)lua_tointeger(L, 1);
    GLsizei count = (int)lua_tointeger(L, 2);
    glShaderSource(shader, count, string, length);
    return 0;
}

static int lua_glStencilFunc(lua_State *L)
{
    GLenum func = (int)lua_tointeger(L, 1);
    GLint ref = (int)lua_tointeger(L, 2);
    GLuint mask = (int)lua_tointeger(L, 3);
    glStencilFunc(func, ref, mask);
    return 0;
}

static int lua_glStencilFuncSeparate(lua_State *L)
{
    GLenum face = (int)lua_tointeger(L, 1);
    GLenum func = (int)lua_tointeger(L, 2);
    GLint ref = (int)lua_tointeger(L, 3);
    GLuint mask = (int)lua_tointeger(L, 4);
    glStencilFuncSeparate(face, func, ref, mask);
    return 0;
}

static int lua_glStencilMask(lua_State *L)
{
    GLuint mask = (int)lua_tointeger(L, 1);
    glStencilMask(mask);
    return 0;
}

static int lua_glStencilMaskSeparate(lua_State *L)
{
    GLenum face = (int)lua_tointeger(L, 1);
    GLuint mask = (int)lua_tointeger(L, 2);
    glStencilMaskSeparate(face, mask);
    return 0;
}

static int lua_glStencilOp(lua_State *L)
{
    GLenum fail = (int)lua_tointeger(L, 1);
    GLenum zfail = (int)lua_tointeger(L, 2);
    GLenum zpass = (int)lua_tointeger(L, 3);
    glStencilOp(fail, zfail, zpass);
    return 0;
}

static int lua_glStencilOpSeparate(lua_State *L)
{
    GLenum face = (int)lua_tointeger(L, 1);
    GLenum fail = (int)lua_tointeger(L, 2);
    GLenum zfail = (int)lua_tointeger(L, 3);
    GLenum zpass = (int)lua_tointeger(L, 4);
    glStencilOpSeparate(face, fail, zfail, zpass);
    return 0;
}

static int lua_glTexImage2D(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLint level = (int)lua_tointeger(L, 2);
    GLint internalformat = (int)lua_tointeger(L, 3);
    GLsizei width = (int)lua_tointeger(L, 4);
    GLsizei height = (int)lua_tointeger(L, 5);
    GLint border = (int)lua_tointeger(L, 6);
    GLenum format = (int)lua_tointeger(L, 7);
    GLenum type = (int)lua_tointeger(L, 8);
    glTexImage2D(target, level, internalformat, width, height, border, format, type, pixels);
    return 0;
}

static int lua_glTexParameterf(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    GLfloat param = lua_tonumber(L, 3);
    glTexParameterf(target, pname, param);
    return 0;
}

static int lua_glTexParameterfv(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    glTexParameterfv(target, pname, params);
    return 0;
}

static int lua_glTexParameteri(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    GLint param = (int)lua_tointeger(L, 3);
    glTexParameteri(target, pname, param);
    return 0;
}

static int lua_glTexParameteriv(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    glTexParameteriv(target, pname, params);
    return 0;
}

static int lua_glTexSubImage2D(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLint level = (int)lua_tointeger(L, 2);
    GLint xoffset = (int)lua_tointeger(L, 3);
    GLint yoffset = (int)lua_tointeger(L, 4);
    GLsizei width = (int)lua_tointeger(L, 5);
    GLsizei height = (int)lua_tointeger(L, 6);
    GLenum format = (int)lua_tointeger(L, 7);
    GLenum type = (int)lua_tointeger(L, 8);
    glTexSubImage2D(target, level, xoffset, yoffset, width, height, format, type, pixels);
    return 0;
}

static int lua_glUniform1f(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);
    GLfloat x = lua_tonumber(L, 2);
    glUniform1f(location, x);
    return 0;
}

static int lua_glUniform1fv(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);
    GLsizei count = (int)lua_tointeger(L, 2);
    glUniform1fv(location, count, v);
    return 0;
}

static int lua_glUniform1i(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);
    GLint x = (int)lua_tointeger(L, 2);
    glUniform1i(location, x);
    return 0;
}

static int lua_glUniform1iv(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);
    GLsizei count = (int)lua_tointeger(L, 2);
    glUniform1iv(location, count, v);
    return 0;
}

static int lua_glUniform2f(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);
    GLfloat x = lua_tonumber(L, 2);
    GLfloat y = lua_tonumber(L, 3);
    glUniform2f(location, x, y);
    return 0;
}

static int lua_glUniform2fv(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);
    GLsizei count = (int)lua_tointeger(L, 2);
    glUniform2fv(location, count, v);
    return 0;
}

static int lua_glUniform2i(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);
    GLint x = (int)lua_tointeger(L, 2);
    GLint y = (int)lua_tointeger(L, 3);
    glUniform2i(location, x, y);
    return 0;
}

static int lua_glUniform2iv(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);
    GLsizei count = (int)lua_tointeger(L, 2);
    glUniform2iv(location, count, v);
    return 0;
}

static int lua_glUniform3f(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);
    GLfloat x = lua_tonumber(L, 2);
    GLfloat y = lua_tonumber(L, 3);
    GLfloat z = lua_tonumber(L, 4);
    glUniform3f(location, x, y, z);
    return 0;
}

static int lua_glUniform3fv(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);
    GLsizei count = (int)lua_tointeger(L, 2);
    glUniform3fv(location, count, v);
    return 0;
}

static int lua_glUniform3i(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);
    GLint x = (int)lua_tointeger(L, 2);
    GLint y = (int)lua_tointeger(L, 3);
    GLint z = (int)lua_tointeger(L, 4);
    glUniform3i(location, x, y, z);
    return 0;
}

static int lua_glUniform3iv(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);
    GLsizei count = (int)lua_tointeger(L, 2);
    glUniform3iv(location, count, v);
    return 0;
}

static int lua_glUniform4f(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);
    GLfloat x = lua_tonumber(L, 2);
    GLfloat y = lua_tonumber(L, 3);
    GLfloat z = lua_tonumber(L, 4);
    GLfloat w = lua_tonumber(L, 5);
    glUniform4f(location, x, y, z, w);
    return 0;
}

static int lua_glUniform4fv(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);
    GLsizei count = (int)lua_tointeger(L, 2);
    glUniform4fv(location, count, v);
    return 0;
}

static int lua_glUniform4i(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);
    GLint x = (int)lua_tointeger(L, 2);
    GLint y = (int)lua_tointeger(L, 3);
    GLint z = (int)lua_tointeger(L, 4);
    GLint w = (int)lua_tointeger(L, 5);
    glUniform4i(location, x, y, z, w);
    return 0;
}

static int lua_glUniform4iv(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);
    GLsizei count = (int)lua_tointeger(L, 2);
    glUniform4iv(location, count, v);
    return 0;
}

static int lua_glUniformMatrix2fv(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);
    GLsizei count = (int)lua_tointeger(L, 2);
    GLboolean transpose = (int)lua_tointeger(L, 3);
    glUniformMatrix2fv(location, count, transpose, value);
    return 0;
}

static int lua_glUniformMatrix3fv(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);
    GLsizei count = (int)lua_tointeger(L, 2);
    GLboolean transpose = (int)lua_tointeger(L, 3);
    glUniformMatrix3fv(location, count, transpose, value);
    return 0;
}

static int lua_glUniformMatrix4fv(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);
    GLsizei count = (int)lua_tointeger(L, 2);
    GLboolean transpose = (int)lua_tointeger(L, 3);
    glUniformMatrix4fv(location, count, transpose, value);
    return 0;
}

static int lua_glUseProgram(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    glUseProgram(program);
    return 0;
}

static int lua_glValidateProgram(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    glValidateProgram(program);
    return 0;
}

static int lua_glVertexAttrib1f(lua_State *L)
{
    GLuint indx = (int)lua_tointeger(L, 1);
    GLfloat x = lua_tonumber(L, 2);
    glVertexAttrib1f(indx, x);
    return 0;
}

static int lua_glVertexAttrib1fv(lua_State *L)
{
    GLuint indx = (int)lua_tointeger(L, 1);
    glVertexAttrib1fv(indx, values);
    return 0;
}

static int lua_glVertexAttrib2f(lua_State *L)
{
    GLuint indx = (int)lua_tointeger(L, 1);
    GLfloat x = lua_tonumber(L, 2);
    GLfloat y = lua_tonumber(L, 3);
    glVertexAttrib2f(indx, x, y);
    return 0;
}

static int lua_glVertexAttrib2fv(lua_State *L)
{
    GLuint indx = (int)lua_tointeger(L, 1);
    glVertexAttrib2fv(indx, values);
    return 0;
}

static int lua_glVertexAttrib3f(lua_State *L)
{
    GLuint indx = (int)lua_tointeger(L, 1);
    GLfloat x = lua_tonumber(L, 2);
    GLfloat y = lua_tonumber(L, 3);
    GLfloat z = lua_tonumber(L, 4);
    glVertexAttrib3f(indx, x, y, z);
    return 0;
}

static int lua_glVertexAttrib3fv(lua_State *L)
{
    GLuint indx = (int)lua_tointeger(L, 1);
    glVertexAttrib3fv(indx, values);
    return 0;
}

static int lua_glVertexAttrib4f(lua_State *L)
{
    GLuint indx = (int)lua_tointeger(L, 1);
    GLfloat x = lua_tonumber(L, 2);
    GLfloat y = lua_tonumber(L, 3);
    GLfloat z = lua_tonumber(L, 4);
    GLfloat w = lua_tonumber(L, 5);
    glVertexAttrib4f(indx, x, y, z, w);
    return 0;
}

static int lua_glVertexAttrib4fv(lua_State *L)
{
    GLuint indx = (int)lua_tointeger(L, 1);
    glVertexAttrib4fv(indx, values);
    return 0;
}

static int lua_glVertexAttribPointer(lua_State *L)
{
    GLuint indx = (int)lua_tointeger(L, 1);
    GLint size = (int)lua_tointeger(L, 2);
    GLenum type = (int)lua_tointeger(L, 3);
    GLboolean normalized = (int)lua_tointeger(L, 4);
    GLsizei stride = (int)lua_tointeger(L, 5);
    glVertexAttribPointer(indx, size, type, normalized, stride, ptr);
    return 0;
}

static int lua_glViewport(lua_State *L)
{
    GLint x = (int)lua_tointeger(L, 1);
    GLint y = (int)lua_tointeger(L, 2);
    GLsizei width = (int)lua_tointeger(L, 3);
    GLsizei height = (int)lua_tointeger(L, 4);
    glViewport(x, y, width, height);
    return 0;
}

static int lua_glReadBuffer(lua_State *L)
{
    GLenum mode = (int)lua_tointeger(L, 1);
    glReadBuffer(mode);
    return 0;
}

static int lua_glDrawRangeElements(lua_State *L)
{
    GLenum mode = (int)lua_tointeger(L, 1);
    GLuint start = (int)lua_tointeger(L, 2);
    GLuint end = (int)lua_tointeger(L, 3);
    GLsizei count = (int)lua_tointeger(L, 4);
    GLenum type = (int)lua_tointeger(L, 5);
    glDrawRangeElements(mode, start, end, count, type, indices);
    return 0;
}

static int lua_glTexImage3D(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLint level = (int)lua_tointeger(L, 2);
    GLint internalformat = (int)lua_tointeger(L, 3);
    GLsizei width = (int)lua_tointeger(L, 4);
    GLsizei height = (int)lua_tointeger(L, 5);
    GLsizei depth = (int)lua_tointeger(L, 6);
    GLint border = (int)lua_tointeger(L, 7);
    GLenum format = (int)lua_tointeger(L, 8);
    GLenum type = (int)lua_tointeger(L, 9);
    glTexImage3D(target, level, internalformat, width, height, depth, border, format, type, pixels);
    return 0;
}

static int lua_glTexSubImage3D(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLint level = (int)lua_tointeger(L, 2);
    GLint xoffset = (int)lua_tointeger(L, 3);
    GLint yoffset = (int)lua_tointeger(L, 4);
    GLint zoffset = (int)lua_tointeger(L, 5);
    GLsizei width = (int)lua_tointeger(L, 6);
    GLsizei height = (int)lua_tointeger(L, 7);
    GLsizei depth = (int)lua_tointeger(L, 8);
    GLenum format = (int)lua_tointeger(L, 9);
    GLenum type = (int)lua_tointeger(L, 10);
    glTexSubImage3D(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, pixels);
    return 0;
}

static int lua_glCopyTexSubImage3D(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLint level = (int)lua_tointeger(L, 2);
    GLint xoffset = (int)lua_tointeger(L, 3);
    GLint yoffset = (int)lua_tointeger(L, 4);
    GLint zoffset = (int)lua_tointeger(L, 5);
    GLint x = (int)lua_tointeger(L, 6);
    GLint y = (int)lua_tointeger(L, 7);
    GLsizei width = (int)lua_tointeger(L, 8);
    GLsizei height = (int)lua_tointeger(L, 9);
    glCopyTexSubImage3D(target, level, xoffset, yoffset, zoffset, x, y, width, height);
    return 0;
}

static int lua_glCompressedTexImage3D(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLint level = (int)lua_tointeger(L, 2);
    GLenum internalformat = (int)lua_tointeger(L, 3);
    GLsizei width = (int)lua_tointeger(L, 4);
    GLsizei height = (int)lua_tointeger(L, 5);
    GLsizei depth = (int)lua_tointeger(L, 6);
    GLint border = (int)lua_tointeger(L, 7);
    GLsizei imageSize = (int)lua_tointeger(L, 8);
    glCompressedTexImage3D(target, level, internalformat, width, height, depth, border, imageSize, data);
    return 0;
}

static int lua_glCompressedTexSubImage3D(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLint level = (int)lua_tointeger(L, 2);
    GLint xoffset = (int)lua_tointeger(L, 3);
    GLint yoffset = (int)lua_tointeger(L, 4);
    GLint zoffset = (int)lua_tointeger(L, 5);
    GLsizei width = (int)lua_tointeger(L, 6);
    GLsizei height = (int)lua_tointeger(L, 7);
    GLsizei depth = (int)lua_tointeger(L, 8);
    GLenum format = (int)lua_tointeger(L, 9);
    GLsizei imageSize = (int)lua_tointeger(L, 10);
    glCompressedTexSubImage3D(target, level, xoffset, yoffset, zoffset, width, height, depth, format, imageSize, data);
    return 0;
}

static int lua_glGenQueries(lua_State *L)
{
    GLsizei n = (int)lua_tointeger(L, 1);
    glGenQueries(n, ids);
    return 0;
}

static int lua_glDeleteQueries(lua_State *L)
{
    GLsizei n = (int)lua_tointeger(L, 1);
    glDeleteQueries(n, ids);
    return 0;
}

static int lua_glIsQuery(lua_State *L)
{
    GLuint id = (int)lua_tointeger(L, 1);
    GLboolean ret = glIsQuery(id);
    lua_pushinteger(L, ret);
    return 1;
}

static int lua_glBeginQuery(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLuint id = (int)lua_tointeger(L, 2);
    glBeginQuery(target, id);
    return 0;
}

static int lua_glEndQuery(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    glEndQuery(target);
    return 0;
}

static int lua_glGetQueryiv(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    glGetQueryiv(target, pname, params);
    return 0;
}

static int lua_glGetQueryObjectuiv(lua_State *L)
{
    GLuint id = (int)lua_tointeger(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    glGetQueryObjectuiv(id, pname, params);
    return 0;
}

static int lua_glUnmapBuffer(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLboolean ret = glUnmapBuffer(target);
    lua_pushinteger(L, ret);
    return 1;
}

static int lua_glGetBufferPointerv(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    glGetBufferPointerv(target, pname, params);
    return 0;
}

static int lua_glDrawBuffers(lua_State *L)
{
    GLsizei n = (int)lua_tointeger(L, 1);
    glDrawBuffers(n, bufs);
    return 0;
}

static int lua_glUniformMatrix2x3fv(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);
    GLsizei count = (int)lua_tointeger(L, 2);
    GLboolean transpose = (int)lua_tointeger(L, 3);
    glUniformMatrix2x3fv(location, count, transpose, value);
    return 0;
}

static int lua_glUniformMatrix3x2fv(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);
    GLsizei count = (int)lua_tointeger(L, 2);
    GLboolean transpose = (int)lua_tointeger(L, 3);
    glUniformMatrix3x2fv(location, count, transpose, value);
    return 0;
}

static int lua_glUniformMatrix2x4fv(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);
    GLsizei count = (int)lua_tointeger(L, 2);
    GLboolean transpose = (int)lua_tointeger(L, 3);
    glUniformMatrix2x4fv(location, count, transpose, value);
    return 0;
}

static int lua_glUniformMatrix4x2fv(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);
    GLsizei count = (int)lua_tointeger(L, 2);
    GLboolean transpose = (int)lua_tointeger(L, 3);
    glUniformMatrix4x2fv(location, count, transpose, value);
    return 0;
}

static int lua_glUniformMatrix3x4fv(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);
    GLsizei count = (int)lua_tointeger(L, 2);
    GLboolean transpose = (int)lua_tointeger(L, 3);
    glUniformMatrix3x4fv(location, count, transpose, value);
    return 0;
}

static int lua_glUniformMatrix4x3fv(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);
    GLsizei count = (int)lua_tointeger(L, 2);
    GLboolean transpose = (int)lua_tointeger(L, 3);
    glUniformMatrix4x3fv(location, count, transpose, value);
    return 0;
}

static int lua_glBlitFramebuffer(lua_State *L)
{
    GLint srcX0 = (int)lua_tointeger(L, 1);
    GLint srcY0 = (int)lua_tointeger(L, 2);
    GLint srcX1 = (int)lua_tointeger(L, 3);
    GLint srcY1 = (int)lua_tointeger(L, 4);
    GLint dstX0 = (int)lua_tointeger(L, 5);
    GLint dstY0 = (int)lua_tointeger(L, 6);
    GLint dstX1 = (int)lua_tointeger(L, 7);
    GLint dstY1 = (int)lua_tointeger(L, 8);
    GLbitfield mask = (int)lua_tointeger(L, 9);
    GLenum filter = (int)lua_tointeger(L, 10);
    glBlitFramebuffer(srcX0, srcY0, srcX1, srcY1, dstX0, dstY0, dstX1, dstY1, mask, filter);
    return 0;
}

static int lua_glRenderbufferStorageMultisample(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLsizei samples = (int)lua_tointeger(L, 2);
    GLenum internalformat = (int)lua_tointeger(L, 3);
    GLsizei width = (int)lua_tointeger(L, 4);
    GLsizei height = (int)lua_tointeger(L, 5);
    glRenderbufferStorageMultisample(target, samples, internalformat, width, height);
    return 0;
}

static int lua_glFramebufferTextureLayer(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLenum attachment = (int)lua_tointeger(L, 2);
    GLuint texture = (int)lua_tointeger(L, 3);
    GLint level = (int)lua_tointeger(L, 4);
    GLint layer = (int)lua_tointeger(L, 5);
    glFramebufferTextureLayer(target, attachment, texture, level, layer);
    return 0;
}

static int lua_glMapBufferRange(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLintptr offset = lua_tointeger(L, 2);
    GLsizeiptr length = lua_tointeger(L, 3);
    GLbitfield access = (int)lua_tointeger(L, 4);
    GLvoid* ret = glMapBufferRange(target, offset, length, access);
    lua_pushlightuserdata(L, ret);
    return 1;
}

static int lua_glFlushMappedBufferRange(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLintptr offset = lua_tointeger(L, 2);
    GLsizeiptr length = lua_tointeger(L, 3);
    glFlushMappedBufferRange(target, offset, length);
    return 0;
}

static int lua_glBindVertexArray(lua_State *L)
{
    GLuint array = (int)lua_tointeger(L, 1);
    glBindVertexArray(array);
    return 0;
}

static int lua_glDeleteVertexArrays(lua_State *L)
{
    GLsizei n = (int)lua_tointeger(L, 1);
    glDeleteVertexArrays(n, arrays);
    return 0;
}

static int lua_glGenVertexArrays(lua_State *L)
{
    GLsizei n = (int)lua_tointeger(L, 1);
    glGenVertexArrays(n, arrays);
    return 0;
}

static int lua_glIsVertexArray(lua_State *L)
{
    GLuint array = (int)lua_tointeger(L, 1);
    GLboolean ret = glIsVertexArray(array);
    lua_pushinteger(L, ret);
    return 1;
}

static int lua_glGetIntegeri_v(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLuint index = (int)lua_tointeger(L, 2);
    glGetIntegeri_v(target, index, data);
    return 0;
}

static int lua_glBeginTransformFeedback(lua_State *L)
{
    GLenum primitiveMode = (int)lua_tointeger(L, 1);
    glBeginTransformFeedback(primitiveMode);
    return 0;
}

static int lua_glEndTransformFeedback(lua_State *L)
{
    glEndTransformFeedback();
    glEndTransformFeedback();
    return 0;
}

static int lua_glBindBufferRange(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLuint index = (int)lua_tointeger(L, 2);
    GLuint buffer = (int)lua_tointeger(L, 3);
    GLintptr offset = lua_tointeger(L, 4);
    GLsizeiptr size = lua_tointeger(L, 5);
    glBindBufferRange(target, index, buffer, offset, size);
    return 0;
}

static int lua_glBindBufferBase(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLuint index = (int)lua_tointeger(L, 2);
    GLuint buffer = (int)lua_tointeger(L, 3);
    glBindBufferBase(target, index, buffer);
    return 0;
}

static int lua_glTransformFeedbackVaryings(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    GLsizei count = (int)lua_tointeger(L, 2);
    GLenum bufferMode = (int)lua_tointeger(L, 4);
    glTransformFeedbackVaryings(program, count, varyings, bufferMode);
    return 0;
}

static int lua_glGetTransformFeedbackVarying(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    GLuint index = (int)lua_tointeger(L, 2);
    GLsizei bufSize = (int)lua_tointeger(L, 3);
    glGetTransformFeedbackVarying(program, index, bufSize, length, size, type, name);
    return 0;
}

static int lua_glVertexAttribIPointer(lua_State *L)
{
    GLuint index = (int)lua_tointeger(L, 1);
    GLint size = (int)lua_tointeger(L, 2);
    GLenum type = (int)lua_tointeger(L, 3);
    GLsizei stride = (int)lua_tointeger(L, 4);
    glVertexAttribIPointer(index, size, type, stride, pointer);
    return 0;
}

static int lua_glGetVertexAttribIiv(lua_State *L)
{
    GLuint index = (int)lua_tointeger(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    glGetVertexAttribIiv(index, pname, params);
    return 0;
}

static int lua_glGetVertexAttribIuiv(lua_State *L)
{
    GLuint index = (int)lua_tointeger(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    glGetVertexAttribIuiv(index, pname, params);
    return 0;
}

static int lua_glVertexAttribI4i(lua_State *L)
{
    GLuint index = (int)lua_tointeger(L, 1);
    GLint x = (int)lua_tointeger(L, 2);
    GLint y = (int)lua_tointeger(L, 3);
    GLint z = (int)lua_tointeger(L, 4);
    GLint w = (int)lua_tointeger(L, 5);
    glVertexAttribI4i(index, x, y, z, w);
    return 0;
}

static int lua_glVertexAttribI4ui(lua_State *L)
{
    GLuint index = (int)lua_tointeger(L, 1);
    GLuint x = (int)lua_tointeger(L, 2);
    GLuint y = (int)lua_tointeger(L, 3);
    GLuint z = (int)lua_tointeger(L, 4);
    GLuint w = (int)lua_tointeger(L, 5);
    glVertexAttribI4ui(index, x, y, z, w);
    return 0;
}

static int lua_glVertexAttribI4iv(lua_State *L)
{
    GLuint index = (int)lua_tointeger(L, 1);
    glVertexAttribI4iv(index, v);
    return 0;
}

static int lua_glVertexAttribI4uiv(lua_State *L)
{
    GLuint index = (int)lua_tointeger(L, 1);
    glVertexAttribI4uiv(index, v);
    return 0;
}

static int lua_glGetUniformuiv(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    GLint location = (int)lua_tointeger(L, 2);
    glGetUniformuiv(program, location, params);
    return 0;
}

static int lua_glGetFragDataLocation(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    GLint ret = glGetFragDataLocation(program, name);
    lua_pushinteger(L, ret);
    return 1;
}

static int lua_glUniform(lua_State *L)
{
    int n = lua_gettop(L);
    switch (n)
    {
        case 2:
        {
            GLint location = (int)lua_tointeger(L, 1);
            GLuint v0 = (int)lua_tointeger(L, 2);
            glUniform1ui(location, v0);
            break;
        }
        case 3:
        {
            GLint location = (int)lua_tointeger(L, 1);
            GLuint v0 = (int)lua_tointeger(L, 2);
            GLuint v1 = (int)lua_tointeger(L, 3);
            glUniform2ui(location, v0, v1);
            break;
        }
        case 4:
        {
            GLint location = (int)lua_tointeger(L, 1);
            GLuint v0 = (int)lua_tointeger(L, 2);
            GLuint v1 = (int)lua_tointeger(L, 3);
            GLuint v2 = (int)lua_tointeger(L, 4);
            glUniform3ui(location, v0, v1, v2);
            break;
        }
        case 5:
        {
            GLint location = (int)lua_tointeger(L, 1);
            GLuint v0 = (int)lua_tointeger(L, 2);
            GLuint v1 = (int)lua_tointeger(L, 3);
            GLuint v2 = (int)lua_tointeger(L, 4);
            GLuint v3 = (int)lua_tointeger(L, 5);
            glUniform4ui(location, v0, v1, v2, v3);
            break;
        }
        default:
            break;
    }
    return 0;
}

static int lua_glUniform1uiv(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);
    GLsizei count = (int)lua_tointeger(L, 2);
    glUniform1uiv(location, count, value);
    return 0;
}

static int lua_glUniform2uiv(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);
    GLsizei count = (int)lua_tointeger(L, 2);
    glUniform2uiv(location, count, value);
    return 0;
}

static int lua_glUniform3uiv(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);
    GLsizei count = (int)lua_tointeger(L, 2);
    glUniform3uiv(location, count, value);
    return 0;
}

static int lua_glUniform4uiv(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);
    GLsizei count = (int)lua_tointeger(L, 2);
    glUniform4uiv(location, count, value);
    return 0;
}

static int lua_glClearBufferiv(lua_State *L)
{
    GLenum buffer = (int)lua_tointeger(L, 1);
    GLint drawbuffer = (int)lua_tointeger(L, 2);
    glClearBufferiv(buffer, drawbuffer, value);
    return 0;
}

static int lua_glClearBufferuiv(lua_State *L)
{
    GLenum buffer = (int)lua_tointeger(L, 1);
    GLint drawbuffer = (int)lua_tointeger(L, 2);
    glClearBufferuiv(buffer, drawbuffer, value);
    return 0;
}

static int lua_glClearBufferfv(lua_State *L)
{
    GLenum buffer = (int)lua_tointeger(L, 1);
    GLint drawbuffer = (int)lua_tointeger(L, 2);
    glClearBufferfv(buffer, drawbuffer, value);
    return 0;
}

static int lua_glClearBufferfi(lua_State *L)
{
    GLenum buffer = (int)lua_tointeger(L, 1);
    GLint drawbuffer = (int)lua_tointeger(L, 2);
    GLfloat depth = lua_tonumber(L, 3);
    GLint stencil = (int)lua_tointeger(L, 4);
    glClearBufferfi(buffer, drawbuffer, depth, stencil);
    return 0;
}

static int lua_glGetStringi(lua_State *L)
{
    GLenum name = (int)lua_tointeger(L, 1);
    GLuint index = (int)lua_tointeger(L, 2);
    const GLubyte* ret = glGetStringi(name, index);
    lua_pushlightuserdata(L, ret);
    return 1;
}

static int lua_glCopyBufferSubData(lua_State *L)
{
    GLenum readTarget = (int)lua_tointeger(L, 1);
    GLenum writeTarget = (int)lua_tointeger(L, 2);
    GLintptr readOffset = lua_tointeger(L, 3);
    GLintptr writeOffset = lua_tointeger(L, 4);
    GLsizeiptr size = lua_tointeger(L, 5);
    glCopyBufferSubData(readTarget, writeTarget, readOffset, writeOffset, size);
    return 0;
}

static int lua_glGetUniformIndices(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    GLsizei uniformCount = (int)lua_tointeger(L, 2);
    glGetUniformIndices(program, uniformCount, uniformNames, uniformIndices);
    return 0;
}

static int lua_glGetActiveUniformsiv(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    GLsizei uniformCount = (int)lua_tointeger(L, 2);
    GLenum pname = (int)lua_tointeger(L, 4);
    glGetActiveUniformsiv(program, uniformCount, uniformIndices, pname, params);
    return 0;
}

static int lua_glGetUniformBlockIndex(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    GLuint ret = glGetUniformBlockIndex(program, uniformBlockName);
    lua_pushinteger(L, ret);
    return 1;
}

static int lua_glGetActiveUniformBlockiv(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    GLuint uniformBlockIndex = (int)lua_tointeger(L, 2);
    GLenum pname = (int)lua_tointeger(L, 3);
    glGetActiveUniformBlockiv(program, uniformBlockIndex, pname, params);
    return 0;
}

static int lua_glGetActiveUniformBlockName(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    GLuint uniformBlockIndex = (int)lua_tointeger(L, 2);
    GLsizei bufSize = (int)lua_tointeger(L, 3);
    glGetActiveUniformBlockName(program, uniformBlockIndex, bufSize, length, uniformBlockName);
    return 0;
}

static int lua_glUniformBlockBinding(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    GLuint uniformBlockIndex = (int)lua_tointeger(L, 2);
    GLuint uniformBlockBinding = (int)lua_tointeger(L, 3);
    glUniformBlockBinding(program, uniformBlockIndex, uniformBlockBinding);
    return 0;
}

static int lua_glDrawArraysInstanced(lua_State *L)
{
    GLenum mode = (int)lua_tointeger(L, 1);
    GLint first = (int)lua_tointeger(L, 2);
    GLsizei count = (int)lua_tointeger(L, 3);
    GLsizei instancecount = (int)lua_tointeger(L, 4);
    glDrawArraysInstanced(mode, first, count, instancecount);
    return 0;
}

static int lua_glDrawElementsInstanced(lua_State *L)
{
    GLenum mode = (int)lua_tointeger(L, 1);
    GLsizei count = (int)lua_tointeger(L, 2);
    GLenum type = (int)lua_tointeger(L, 3);
    GLsizei instancecount = (int)lua_tointeger(L, 5);
    glDrawElementsInstanced(mode, count, type, indices, instancecount);
    return 0;
}

static int lua_glFenceSync(lua_State *L)
{
    GLenum condition = (int)lua_tointeger(L, 1);
    GLbitfield flags = (int)lua_tointeger(L, 2);
    GLsync ret = glFenceSync(condition, flags);
    lua_pushlightuserdata(L, ret);
    return 1;
}

static int lua_glIsSync(lua_State *L)
{
    GLsync sync = lua_touserdata(L, 1);
    GLboolean ret = glIsSync(sync);
    lua_pushinteger(L, ret);
    return 1;
}

static int lua_glDeleteSync(lua_State *L)
{
    GLsync sync = lua_touserdata(L, 1);
    glDeleteSync(sync);
    return 0;
}

static int lua_glClientWaitSync(lua_State *L)
{
    GLsync sync = lua_touserdata(L, 1);
    GLbitfield flags = (int)lua_tointeger(L, 2);
    GLuint64 timeout = lua_tointeger(L, 3);
    GLenum ret = glClientWaitSync(sync, flags, timeout);
    lua_pushinteger(L, ret);
    return 1;
}

static int lua_glWaitSync(lua_State *L)
{
    GLsync sync = lua_touserdata(L, 1);
    GLbitfield flags = (int)lua_tointeger(L, 2);
    GLuint64 timeout = lua_tointeger(L, 3);
    glWaitSync(sync, flags, timeout);
    return 0;
}

static int lua_glGetInteger64v(lua_State *L)
{
    GLenum pname = (int)lua_tointeger(L, 1);
    glGetInteger64v(pname, params);
    return 0;
}

static int lua_glGetSynciv(lua_State *L)
{
    GLsync sync = lua_touserdata(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    GLsizei bufSize = (int)lua_tointeger(L, 3);
    glGetSynciv(sync, pname, bufSize, length, values);
    return 0;
}

static int lua_glGetInteger64i_v(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLuint index = (int)lua_tointeger(L, 2);
    glGetInteger64i_v(target, index, data);
    return 0;
}

static int lua_glGetBufferParameteri64v(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    glGetBufferParameteri64v(target, pname, params);
    return 0;
}

static int lua_glGenSamplers(lua_State *L)
{
    GLsizei count = (int)lua_tointeger(L, 1);
    glGenSamplers(count, samplers);
    return 0;
}

static int lua_glDeleteSamplers(lua_State *L)
{
    GLsizei count = (int)lua_tointeger(L, 1);
    glDeleteSamplers(count, samplers);
    return 0;
}

static int lua_glIsSampler(lua_State *L)
{
    GLuint sampler = (int)lua_tointeger(L, 1);
    GLboolean ret = glIsSampler(sampler);
    lua_pushinteger(L, ret);
    return 1;
}

static int lua_glBindSampler(lua_State *L)
{
    GLuint unit = (int)lua_tointeger(L, 1);
    GLuint sampler = (int)lua_tointeger(L, 2);
    glBindSampler(unit, sampler);
    return 0;
}

static int lua_glSamplerParameteri(lua_State *L)
{
    GLuint sampler = (int)lua_tointeger(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    GLint param = (int)lua_tointeger(L, 3);
    glSamplerParameteri(sampler, pname, param);
    return 0;
}

static int lua_glSamplerParameteriv(lua_State *L)
{
    GLuint sampler = (int)lua_tointeger(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    glSamplerParameteriv(sampler, pname, param);
    return 0;
}

static int lua_glSamplerParameterf(lua_State *L)
{
    GLuint sampler = (int)lua_tointeger(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    GLfloat param = lua_tonumber(L, 3);
    glSamplerParameterf(sampler, pname, param);
    return 0;
}

static int lua_glSamplerParameterfv(lua_State *L)
{
    GLuint sampler = (int)lua_tointeger(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    glSamplerParameterfv(sampler, pname, param);
    return 0;
}

static int lua_glGetSamplerParameteriv(lua_State *L)
{
    GLuint sampler = (int)lua_tointeger(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    glGetSamplerParameteriv(sampler, pname, params);
    return 0;
}

static int lua_glGetSamplerParameterfv(lua_State *L)
{
    GLuint sampler = (int)lua_tointeger(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    glGetSamplerParameterfv(sampler, pname, params);
    return 0;
}

static int lua_glVertexAttribDivisor(lua_State *L)
{
    GLuint index = (int)lua_tointeger(L, 1);
    GLuint divisor = (int)lua_tointeger(L, 2);
    glVertexAttribDivisor(index, divisor);
    return 0;
}

static int lua_glBindTransformFeedback(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLuint id = (int)lua_tointeger(L, 2);
    glBindTransformFeedback(target, id);
    return 0;
}

static int lua_glDeleteTransformFeedbacks(lua_State *L)
{
    GLsizei n = (int)lua_tointeger(L, 1);
    glDeleteTransformFeedbacks(n, ids);
    return 0;
}

static int lua_glGenTransformFeedbacks(lua_State *L)
{
    GLsizei n = (int)lua_tointeger(L, 1);
    glGenTransformFeedbacks(n, ids);
    return 0;
}

static int lua_glIsTransformFeedback(lua_State *L)
{
    GLuint id = (int)lua_tointeger(L, 1);
    GLboolean ret = glIsTransformFeedback(id);
    lua_pushinteger(L, ret);
    return 1;
}

static int lua_glPauseTransformFeedback(lua_State *L)
{
    glPauseTransformFeedback();
    glPauseTransformFeedback();
    return 0;
}

static int lua_glResumeTransformFeedback(lua_State *L)
{
    glResumeTransformFeedback();
    glResumeTransformFeedback();
    return 0;
}

static int lua_glGetProgramBinary(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    GLsizei bufSize = (int)lua_tointeger(L, 2);
    GLvoid* binary = lua_tostring(L, 5);
    glGetProgramBinary(program, bufSize, length, binaryFormat, binary);
    return 0;
}

static int lua_glProgramBinary(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    GLenum binaryFormat = (int)lua_tointeger(L, 2);
    GLsizei length = (int)lua_tointeger(L, 4);
    glProgramBinary(program, binaryFormat, binary, length);
    return 0;
}

static int lua_glProgramParameteri(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    GLint value = (int)lua_tointeger(L, 3);
    glProgramParameteri(program, pname, value);
    return 0;
}

static int lua_glInvalidateFramebuffer(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLsizei numAttachments = (int)lua_tointeger(L, 2);
    glInvalidateFramebuffer(target, numAttachments, attachments);
    return 0;
}

static int lua_glInvalidateSubFramebuffer(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLsizei numAttachments = (int)lua_tointeger(L, 2);
    GLint x = (int)lua_tointeger(L, 4);
    GLint y = (int)lua_tointeger(L, 5);
    GLsizei width = (int)lua_tointeger(L, 6);
    GLsizei height = (int)lua_tointeger(L, 7);
    glInvalidateSubFramebuffer(target, numAttachments, attachments, x, y, width, height);
    return 0;
}

static int lua_glTexStorage2D(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLsizei levels = (int)lua_tointeger(L, 2);
    GLenum internalformat = (int)lua_tointeger(L, 3);
    GLsizei width = (int)lua_tointeger(L, 4);
    GLsizei height = (int)lua_tointeger(L, 5);
    glTexStorage2D(target, levels, internalformat, width, height);
    return 0;
}

static int lua_glTexStorage3D(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLsizei levels = (int)lua_tointeger(L, 2);
    GLenum internalformat = (int)lua_tointeger(L, 3);
    GLsizei width = (int)lua_tointeger(L, 4);
    GLsizei height = (int)lua_tointeger(L, 5);
    GLsizei depth = (int)lua_tointeger(L, 6);
    glTexStorage3D(target, levels, internalformat, width, height, depth);
    return 0;
}

static int lua_glGetInternalformativ(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLenum internalformat = (int)lua_tointeger(L, 2);
    GLenum pname = (int)lua_tointeger(L, 3);
    GLsizei bufSize = (int)lua_tointeger(L, 4);
    glGetInternalformativ(target, internalformat, pname, bufSize, params);
    return 0;
}



static const luaL_Reg luagl_func = {
    {"ActiveTexture", lua_glActiveTexture}
    {"AttachShader", lua_glAttachShader}
    {"BindAttribLocation", lua_glBindAttribLocation}
    {"BindBuffer", lua_glBindBuffer}
    {"BindFramebuffer", lua_glBindFramebuffer}
    {"BindRenderbuffer", lua_glBindRenderbuffer}
    {"BindTexture", lua_glBindTexture}
    {"BlendColor", lua_glBlendColor}
    {"BlendEquation", lua_glBlendEquation}
    {"BlendEquationSeparate", lua_glBlendEquationSeparate}
    {"BlendFunc", lua_glBlendFunc}
    {"BlendFuncSeparate", lua_glBlendFuncSeparate}
    {"BufferData", lua_glBufferData}
    {"BufferSubData", lua_glBufferSubData}
    {"CheckFramebufferStatus", lua_glCheckFramebufferStatus}
    {"Clear", lua_glClear}
    {"ClearColor", lua_glClearColor}
    {"ClearDepthf", lua_glClearDepthf}
    {"ClearStencil", lua_glClearStencil}
    {"ColorMask", lua_glColorMask}
    {"CompileShader", lua_glCompileShader}
    {"CompressedTexImage2D", lua_glCompressedTexImage2D}
    {"CompressedTexSubImage2D", lua_glCompressedTexSubImage2D}
    {"CopyTexImage2D", lua_glCopyTexImage2D}
    {"CopyTexSubImage2D", lua_glCopyTexSubImage2D}
    {"CreateProgram", lua_glCreateProgram}
    {"CreateShader", lua_glCreateShader}
    {"CullFace", lua_glCullFace}
    {"DeleteBuffers", lua_glDeleteBuffers}
    {"DeleteFramebuffers", lua_glDeleteFramebuffers}
    {"DeleteProgram", lua_glDeleteProgram}
    {"DeleteRenderbuffers", lua_glDeleteRenderbuffers}
    {"DeleteShader", lua_glDeleteShader}
    {"DeleteTextures", lua_glDeleteTextures}
    {"DepthFunc", lua_glDepthFunc}
    {"DepthMask", lua_glDepthMask}
    {"DepthRangef", lua_glDepthRangef}
    {"DetachShader", lua_glDetachShader}
    {"Disable", lua_glDisable}
    {"DisableVertexAttribArray", lua_glDisableVertexAttribArray}
    {"DrawArrays", lua_glDrawArrays}
    {"DrawElements", lua_glDrawElements}
    {"Enable", lua_glEnable}
    {"EnableVertexAttribArray", lua_glEnableVertexAttribArray}
    {"Finish", lua_glFinish}
    {"Flush", lua_glFlush}
    {"FramebufferRenderbuffer", lua_glFramebufferRenderbuffer}
    {"FramebufferTexture2D", lua_glFramebufferTexture2D}
    {"FrontFace", lua_glFrontFace}
    {"GenBuffers", lua_glGenBuffers}
    {"GenerateMipmap", lua_glGenerateMipmap}
    {"GenFramebuffers", lua_glGenFramebuffers}
    {"GenRenderbuffers", lua_glGenRenderbuffers}
    {"GenTextures", lua_glGenTextures}
    {"GetActiveAttrib", lua_glGetActiveAttrib}
    {"GetActiveUniform", lua_glGetActiveUniform}
    {"GetAttachedShaders", lua_glGetAttachedShaders}
    {"GetAttribLocation", lua_glGetAttribLocation}
    {"GetBooleanv", lua_glGetBooleanv}
    {"GetBufferParameteriv", lua_glGetBufferParameteriv}
    {"GetError", lua_glGetError}
    {"GetFloatv", lua_glGetFloatv}
    {"GetFramebufferAttachmentParameteriv", lua_glGetFramebufferAttachmentParameteriv}
    {"GetIntegerv", lua_glGetIntegerv}
    {"GetProgramiv", lua_glGetProgramiv}
    {"GetProgramInfoLog", lua_glGetProgramInfoLog}
    {"GetRenderbufferParameteriv", lua_glGetRenderbufferParameteriv}
    {"GetShaderiv", lua_glGetShaderiv}
    {"GetShaderInfoLog", lua_glGetShaderInfoLog}
    {"GetShaderPrecisionFormat", lua_glGetShaderPrecisionFormat}
    {"GetShaderSource", lua_glGetShaderSource}
    {"GetString", lua_glGetString}
    {"GetTexParameterfv", lua_glGetTexParameterfv}
    {"GetTexParameteriv", lua_glGetTexParameteriv}
    {"GetUniformfv", lua_glGetUniformfv}
    {"GetUniformiv", lua_glGetUniformiv}
    {"GetUniformLocation", lua_glGetUniformLocation}
    {"GetVertexAttribfv", lua_glGetVertexAttribfv}
    {"GetVertexAttribiv", lua_glGetVertexAttribiv}
    {"GetVertexAttribPointerv", lua_glGetVertexAttribPointerv}
    {"Hint", lua_glHint}
    {"IsBuffer", lua_glIsBuffer}
    {"IsEnabled", lua_glIsEnabled}
    {"IsFramebuffer", lua_glIsFramebuffer}
    {"IsProgram", lua_glIsProgram}
    {"IsRenderbuffer", lua_glIsRenderbuffer}
    {"IsShader", lua_glIsShader}
    {"IsTexture", lua_glIsTexture}
    {"LineWidth", lua_glLineWidth}
    {"LinkProgram", lua_glLinkProgram}
    {"PixelStorei", lua_glPixelStorei}
    {"PolygonOffset", lua_glPolygonOffset}
    {"ReadPixels", lua_glReadPixels}
    {"ReleaseShaderCompiler", lua_glReleaseShaderCompiler}
    {"RenderbufferStorage", lua_glRenderbufferStorage}
    {"SampleCoverage", lua_glSampleCoverage}
    {"Scissor", lua_glScissor}
    {"ShaderBinary", lua_glShaderBinary}
    {"ShaderSource", lua_glShaderSource}
    {"StencilFunc", lua_glStencilFunc}
    {"StencilFuncSeparate", lua_glStencilFuncSeparate}
    {"StencilMask", lua_glStencilMask}
    {"StencilMaskSeparate", lua_glStencilMaskSeparate}
    {"StencilOp", lua_glStencilOp}
    {"StencilOpSeparate", lua_glStencilOpSeparate}
    {"TexImage2D", lua_glTexImage2D}
    {"TexParameterf", lua_glTexParameterf}
    {"TexParameterfv", lua_glTexParameterfv}
    {"TexParameteri", lua_glTexParameteri}
    {"TexParameteriv", lua_glTexParameteriv}
    {"TexSubImage2D", lua_glTexSubImage2D}
    {"Uniform1f", lua_glUniform1f}
    {"Uniform1fv", lua_glUniform1fv}
    {"Uniform1i", lua_glUniform1i}
    {"Uniform1iv", lua_glUniform1iv}
    {"Uniform2f", lua_glUniform2f}
    {"Uniform2fv", lua_glUniform2fv}
    {"Uniform2i", lua_glUniform2i}
    {"Uniform2iv", lua_glUniform2iv}
    {"Uniform3f", lua_glUniform3f}
    {"Uniform3fv", lua_glUniform3fv}
    {"Uniform3i", lua_glUniform3i}
    {"Uniform3iv", lua_glUniform3iv}
    {"Uniform4f", lua_glUniform4f}
    {"Uniform4fv", lua_glUniform4fv}
    {"Uniform4i", lua_glUniform4i}
    {"Uniform4iv", lua_glUniform4iv}
    {"UniformMatrix2fv", lua_glUniformMatrix2fv}
    {"UniformMatrix3fv", lua_glUniformMatrix3fv}
    {"UniformMatrix4fv", lua_glUniformMatrix4fv}
    {"UseProgram", lua_glUseProgram}
    {"ValidateProgram", lua_glValidateProgram}
    {"VertexAttrib1f", lua_glVertexAttrib1f}
    {"VertexAttrib1fv", lua_glVertexAttrib1fv}
    {"VertexAttrib2f", lua_glVertexAttrib2f}
    {"VertexAttrib2fv", lua_glVertexAttrib2fv}
    {"VertexAttrib3f", lua_glVertexAttrib3f}
    {"VertexAttrib3fv", lua_glVertexAttrib3fv}
    {"VertexAttrib4f", lua_glVertexAttrib4f}
    {"VertexAttrib4fv", lua_glVertexAttrib4fv}
    {"VertexAttribPointer", lua_glVertexAttribPointer}
    {"Viewport", lua_glViewport}
    {"ReadBuffer", lua_glReadBuffer}
    {"DrawRangeElements", lua_glDrawRangeElements}
    {"TexImage3D", lua_glTexImage3D}
    {"TexSubImage3D", lua_glTexSubImage3D}
    {"CopyTexSubImage3D", lua_glCopyTexSubImage3D}
    {"CompressedTexImage3D", lua_glCompressedTexImage3D}
    {"CompressedTexSubImage3D", lua_glCompressedTexSubImage3D}
    {"GenQueries", lua_glGenQueries}
    {"DeleteQueries", lua_glDeleteQueries}
    {"IsQuery", lua_glIsQuery}
    {"BeginQuery", lua_glBeginQuery}
    {"EndQuery", lua_glEndQuery}
    {"GetQueryiv", lua_glGetQueryiv}
    {"GetQueryObjectuiv", lua_glGetQueryObjectuiv}
    {"UnmapBuffer", lua_glUnmapBuffer}
    {"GetBufferPointerv", lua_glGetBufferPointerv}
    {"DrawBuffers", lua_glDrawBuffers}
    {"UniformMatrix2x3fv", lua_glUniformMatrix2x3fv}
    {"UniformMatrix3x2fv", lua_glUniformMatrix3x2fv}
    {"UniformMatrix2x4fv", lua_glUniformMatrix2x4fv}
    {"UniformMatrix4x2fv", lua_glUniformMatrix4x2fv}
    {"UniformMatrix3x4fv", lua_glUniformMatrix3x4fv}
    {"UniformMatrix4x3fv", lua_glUniformMatrix4x3fv}
    {"BlitFramebuffer", lua_glBlitFramebuffer}
    {"RenderbufferStorageMultisample", lua_glRenderbufferStorageMultisample}
    {"FramebufferTextureLayer", lua_glFramebufferTextureLayer}
    {"MapBufferRange", lua_glMapBufferRange}
    {"FlushMappedBufferRange", lua_glFlushMappedBufferRange}
    {"BindVertexArray", lua_glBindVertexArray}
    {"DeleteVertexArrays", lua_glDeleteVertexArrays}
    {"GenVertexArrays", lua_glGenVertexArrays}
    {"IsVertexArray", lua_glIsVertexArray}
    {"GetIntegeri_v", lua_glGetIntegeri_v}
    {"BeginTransformFeedback", lua_glBeginTransformFeedback}
    {"EndTransformFeedback", lua_glEndTransformFeedback}
    {"BindBufferRange", lua_glBindBufferRange}
    {"BindBufferBase", lua_glBindBufferBase}
    {"TransformFeedbackVaryings", lua_glTransformFeedbackVaryings}
    {"GetTransformFeedbackVarying", lua_glGetTransformFeedbackVarying}
    {"VertexAttribIPointer", lua_glVertexAttribIPointer}
    {"GetVertexAttribIiv", lua_glGetVertexAttribIiv}
    {"GetVertexAttribIuiv", lua_glGetVertexAttribIuiv}
    {"VertexAttribI4i", lua_glVertexAttribI4i}
    {"VertexAttribI4ui", lua_glVertexAttribI4ui}
    {"VertexAttribI4iv", lua_glVertexAttribI4iv}
    {"VertexAttribI4uiv", lua_glVertexAttribI4uiv}
    {"GetUniformuiv", lua_glGetUniformuiv}
    {"GetFragDataLocation", lua_glGetFragDataLocation}
    {"Uniform1ui", lua_glUniform1ui}
    {"Uniform2ui", lua_glUniform2ui}
    {"Uniform3ui", lua_glUniform3ui}
    {"Uniform4ui", lua_glUniform4ui}
    {"Uniform1uiv", lua_glUniform1uiv}
    {"Uniform2uiv", lua_glUniform2uiv}
    {"Uniform3uiv", lua_glUniform3uiv}
    {"Uniform4uiv", lua_glUniform4uiv}
    {"ClearBufferiv", lua_glClearBufferiv}
    {"ClearBufferuiv", lua_glClearBufferuiv}
    {"ClearBufferfv", lua_glClearBufferfv}
    {"ClearBufferfi", lua_glClearBufferfi}
    {"GetStringi", lua_glGetStringi}
    {"CopyBufferSubData", lua_glCopyBufferSubData}
    {"GetUniformIndices", lua_glGetUniformIndices}
    {"GetActiveUniformsiv", lua_glGetActiveUniformsiv}
    {"GetUniformBlockIndex", lua_glGetUniformBlockIndex}
    {"GetActiveUniformBlockiv", lua_glGetActiveUniformBlockiv}
    {"GetActiveUniformBlockName", lua_glGetActiveUniformBlockName}
    {"UniformBlockBinding", lua_glUniformBlockBinding}
    {"DrawArraysInstanced", lua_glDrawArraysInstanced}
    {"DrawElementsInstanced", lua_glDrawElementsInstanced}
    {"FenceSync", lua_glFenceSync}
    {"IsSync", lua_glIsSync}
    {"DeleteSync", lua_glDeleteSync}
    {"ClientWaitSync", lua_glClientWaitSync}
    {"WaitSync", lua_glWaitSync}
    {"GetInteger64v", lua_glGetInteger64v}
    {"GetSynciv", lua_glGetSynciv}
    {"GetInteger64i_v", lua_glGetInteger64i_v}
    {"GetBufferParameteri64v", lua_glGetBufferParameteri64v}
    {"GenSamplers", lua_glGenSamplers}
    {"DeleteSamplers", lua_glDeleteSamplers}
    {"IsSampler", lua_glIsSampler}
    {"BindSampler", lua_glBindSampler}
    {"SamplerParameteri", lua_glSamplerParameteri}
    {"SamplerParameteriv", lua_glSamplerParameteriv}
    {"SamplerParameterf", lua_glSamplerParameterf}
    {"SamplerParameterfv", lua_glSamplerParameterfv}
    {"GetSamplerParameteriv", lua_glGetSamplerParameteriv}
    {"GetSamplerParameterfv", lua_glGetSamplerParameterfv}
    {"VertexAttribDivisor", lua_glVertexAttribDivisor}
    {"BindTransformFeedback", lua_glBindTransformFeedback}
    {"DeleteTransformFeedbacks", lua_glDeleteTransformFeedbacks}
    {"GenTransformFeedbacks", lua_glGenTransformFeedbacks}
    {"IsTransformFeedback", lua_glIsTransformFeedback}
    {"PauseTransformFeedback", lua_glPauseTransformFeedback}
    {"ResumeTransformFeedback", lua_glResumeTransformFeedback}
    {"GetProgramBinary", lua_glGetProgramBinary}
    {"ProgramBinary", lua_glProgramBinary}
    {"ProgramParameteri", lua_glProgramParameteri}
    {"InvalidateFramebuffer", lua_glInvalidateFramebuffer}
    {"InvalidateSubFramebuffer", lua_glInvalidateSubFramebuffer}
    {"TexStorage2D", lua_glTexStorage2D}
    {"TexStorage3D", lua_glTexStorage3D}
    {"GetInternalformativ", lua_glGetInternalformativ}
}


LUAMOD_API int luaopen_gles (lua_State *L)
{
    luaL_newlib(L, luagl_func);
    return 1;
}


