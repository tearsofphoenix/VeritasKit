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
    GLint params = 0;
    glGetRenderbufferParameteriv(target, pname, &params);
    lua_pushinteger(L, params);
    return 1;
}

static int lua_glGetShaderiv(lua_State *L)
{
    GLuint shader = (int)lua_tointeger(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    GLint params = 0;
    glGetShaderiv(shader, pname, &params);
    lua_pushinteger(L, params);
    return 1;
}

static int lua_glGetShaderInfoLog(lua_State *L)
{
    GLuint shader = (int)lua_tointeger(L, 1);
    GLint length = 0;
    glGetShaderiv(shader, GL_INFO_LOG_LENGTH, &length);
    GLsizei bufsize = sizeof(GLchar) * length;
    GLchar *infolog = malloc(bufsize);
    
    glGetShaderInfoLog(shader, bufsize, &length, infolog);
    lua_pushstring(L, infolog);
    free(infolog);
    
    return 1;
}

static int lua_glGetShaderPrecisionFormat(lua_State *L)
{
    GLenum shadertype = (int)lua_tointeger(L, 1);
    GLenum precisiontype = (int)lua_tointeger(L, 2);
    GLint range = 0;
    GLint precision = 0;
    glGetShaderPrecisionFormat(shadertype, precisiontype, &range, &precision);
    lua_pushinteger(L, range);
    lua_pushinteger(L, precision);
    return 2;
}

static int lua_glGetShaderSource(lua_State *L)
{
    GLuint shader = (int)lua_tointeger(L, 1);
    GLint length = 0;
    glGetShaderiv(shader, GL_SHADER_SOURCE_LENGTH, &length);
    GLsizei bufsize = sizeof(GLchar) * length;
    GLchar *source = malloc(bufsize);
    glGetShaderSource(shader, bufsize, &length, source);
    lua_pushstring(L, source);
    free(source);
    
    return 1;
}

static int lua_glGetString(lua_State *L)
{
    GLenum name = (int)lua_tointeger(L, 1);
    const GLubyte* ret = glGetString(name);
    lua_pushstring(L, (const char *)ret);
    return 1;
}

static int lua_glGetTexParameter(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    if (!(GL_TEXTURE_2D == target
        || GL_TEXTURE_CUBE_MAP == target))
    {
        luaL_error(L, "Invalid target: %ld in glGetTexParameter", target);
    }
    
    GLenum pname = (int)lua_tointeger(L, 2);
    
    if (!(GL_TEXTURE_MIN_FILTER == pname
          || GL_TEXTURE_MAG_FILTER == pname
          || GL_TEXTURE_WRAP_S == pname
          || GL_TEXTURE_WRAP_T == pname)
        )
    {
        luaL_error(L, "Invalid pname: %ld in glGetTexParameter", pname);
    }
        
    GLfloat params = 0;
    
    //glGetTexParameteriv(target, pname, params);
    //
    glGetTexParameterfv(target, pname, &params);

    lua_pushnumber(L, params);
    return 1;
}

static int lua_glGetUniform(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    GLint location = (int)lua_tointeger(L, 2);
    
    GLfloat params[3] = {0, 0, 0};
    glGetUniformfv(program, location, params);
    lua_pushnumber(L, params[0]);
    lua_pushnumber(L, params[1]);
    lua_pushnumber(L, params[2]);
    
    //glGetUniformiv(program, location, params);
    return 3;
}

static int lua_glGetUniformLocation(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    const GLchar *name = lua_tostring(L, 2);
    
    int ret = glGetUniformLocation(program, name);
    lua_pushinteger(L, ret);
    return 1;
}

static int lua_glGetVertexAttrib(lua_State *L)
{
    GLuint index = (int)lua_tointeger(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    
    switch (pname)
    {
        case GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING:
        case GL_VERTEX_ATTRIB_ARRAY_ENABLED:
        case GL_VERTEX_ATTRIB_ARRAY_SIZE:
        case GL_VERTEX_ATTRIB_ARRAY_STRIDE:
        case GL_VERTEX_ATTRIB_ARRAY_TYPE:
        case GL_VERTEX_ATTRIB_ARRAY_NORMALIZED:
        {
            GLfloat params;

            glGetVertexAttribfv(index, pname, &params);
            
            lua_pushnumber(L, params);
            return 1;
        }
            case GL_CURRENT_VERTEX_ATTRIB:
        {
            GLfloat params[4] = {0, 0, 0, 1};
            glGetVertexAttribfv(index, pname, params);
            
            lua_pushnumber(L, params[0]);
            lua_pushnumber(L, params[1]);
            lua_pushnumber(L, params[2]);
            lua_pushnumber(L, params[3]);
            return 4;
        }
        default:
        {
            luaL_error(L, "Invalid pname: %ld for glGetVertexAttrib", pname);
            break;
        }
    }
    
    //glGetVertexAttribiv(index, pname, params);
    return 0;
}

static int lua_glGetVertexAttribPointerv(lua_State *L)
{
    GLuint index = (int)lua_tointeger(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    GLvoid *pointer = NULL;
    glGetVertexAttribPointerv(index, pname, &pointer);
    lua_pushinteger(L, (lua_Integer)pointer);
    return 1;
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
    lua_pushboolean(L, ret);
    return 1;
}

static int lua_glIsEnabled(lua_State *L)
{
    GLenum cap = (int)lua_tointeger(L, 1);
    GLboolean ret = glIsEnabled(cap);
    lua_pushboolean(L, ret);
    return 1;
}

static int lua_glIsFramebuffer(lua_State *L)
{
    GLuint framebuffer = (int)lua_tointeger(L, 1);
    GLboolean ret = glIsFramebuffer(framebuffer);
    lua_pushboolean(L, ret);
    return 1;
}

static int lua_glIsProgram(lua_State *L)
{
    GLuint program = (int)lua_tointeger(L, 1);
    GLboolean ret = glIsProgram(program);
    lua_pushboolean(L, ret);
    return 1;
}

static int lua_glIsRenderbuffer(lua_State *L)
{
    GLuint renderbuffer = (int)lua_tointeger(L, 1);
    GLboolean ret = glIsRenderbuffer(renderbuffer);
    lua_pushboolean(L, ret);
    return 1;
}

static int lua_glIsShader(lua_State *L)
{
    GLuint shader = (int)lua_tointeger(L, 1);
    GLboolean ret = glIsShader(shader);
    lua_pushboolean(L, ret);
    return 1;
}

static int lua_glIsTexture(lua_State *L)
{
    GLuint texture = (int)lua_tointeger(L, 1);
    GLboolean ret = glIsTexture(texture);
    lua_pushboolean(L, ret);
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
    GLvoid *pixels = malloc(width * height * 16 * sizeof(GLfloat));
    
    glReadPixels(x, y, width, height, format, type, pixels);
    luaL_error(L, "Not implemented!");
    return 0;
}

static int lua_glReleaseShaderCompiler(lua_State *L)
{
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
    int type = lua_type(L, 1);
    if (LUA_TTABLE == type)
    {
        int count = (int)lua_rawlen(L, 1);
        for (int i = 1; i <= count; ++i)
        {
             lua_rawgeti(L, 1, i);
        }
    }
    GLsizei n = (int)lua_tointeger(L, 1);
    GLenum binaryformat = (int)lua_tointeger(L, 3);
    GLsizei length = (int)lua_tointeger(L, 5);
    //glShaderBinary(n, shaders, binaryformat, binary, length);
    //TODO
    return 0;
}

static int lua_glShaderSource(lua_State *L)
{
    GLuint shader = (int)lua_tointeger(L, 1);
    GLsizei count = (int)lua_tointeger(L, 2);
    //glShaderSource(shader, count, string, length);
    //TODO
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
    GLvoid *pixels = NULL;
    //TODO
    glTexImage2D(target, level, internalformat, width, height, border, format, type, pixels);
    return 0;
}

static int lua_glTexParameter(lua_State *L)
{
    GLenum target = (int)lua_tointeger(L, 1);
    GLenum pname = (int)lua_tointeger(L, 2);
    int type = lua_type(L, 3);
    if (LUA_TNUMBER == type)
    {
        GLfloat param = lua_tonumber(L, 3);
        glTexParameterf(target, pname, param);
    }else
    {
        GLfloat *array = LUAGL_NEW_ARRAY(GLfloat, 4);
        luagl_get_arrayf(L, 3, &array);
        
        glTexParameterfv(target, pname, array);
        
        free(array);
    }
    //glTexParameteri(target, pname, param);
    //glTexParameteriv(target, pname, params);

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
    GLvoid *pixels = NULL;
    //TODO
    glTexSubImage2D(target, level, xoffset, yoffset, width, height, format, type, pixels);
    return 0;
}

static int lua_glUniform(lua_State *L)
{
    GLint location = (int)lua_tointeger(L, 1);

    int narg = lua_gettop(L);
    switch (narg)
    {
        case 2:
        {
            int type = lua_type(L, 2);
            if (LUA_TNUMBER == type)
            {
                GLfloat x = lua_tonumber(L, 2);
                glUniform1f(location, x);
            }else
            {
                //TODO
            }
            break;
        }
        case 3:
        {
            GLfloat x = lua_tonumber(L, 2);
            GLfloat y = lua_tonumber(L, 3);
            glUniform2f(location, x, y);
            break;
        }
        case 4:
        {
            GLfloat x = lua_tonumber(L, 2);
            GLfloat y = lua_tonumber(L, 3);
            GLfloat z = lua_tonumber(L, 4);
            glUniform3f(location, x, y, z);
            break;
        }
        case 5:
        {
            GLfloat x = lua_tonumber(L, 2);
            GLfloat y = lua_tonumber(L, 3);
            GLfloat z = lua_tonumber(L, 4);
            GLfloat w = lua_tonumber(L, 5);
            glUniform4f(location, x, y, z, w);
            break;
        }
        default:
            break;
    }

//    glUniform1f(location, x);
//    glUniform1fv(location, count, v);
//    glUniform1i(location, x);
//    glUniform1iv(location, count, v);
//    glUniform2f(location, x, y);
//    glUniform2fv(location, count, v);
//    glUniform2i(location, x, y);
//    glUniform2iv(location, count, v);
//    glUniform3f(location, x, y, z);
//    glUniform3fv(location, count, v);
//    glUniform3i(location, x, y, z);
//    glUniform3iv(location, count, v);
//    glUniform4f(location, x, y, z, w);
//    glUniform4fv(location, count, v);
//    glUniform4i(location, x, y, z, w);
//    glUniform4iv(location, count, v);

    return 0;
}

static int lua_glUniformMatrix(lua_State *L)
{
    //TODO
//    GLint location = (int)lua_tointeger(L, 1);
//    GLsizei count = (int)lua_tointeger(L, 2);
//    GLboolean transpose = (int)lua_tointeger(L, 3);
//    glUniformMatrix2fv(location, count, transpose, value);
//    glUniformMatrix3fv(location, count, transpose, value);
//    glUniformMatrix4fv(location, count, transpose, value);

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

static int lua_glVertexAttrib(lua_State *L)
{
    GLuint indx = (int)lua_tointeger(L, 1);
    int narg = lua_gettop(L);
    switch (narg)
    {
        case 2:
        {
            GLfloat x = lua_tonumber(L, 2);
            glVertexAttrib1f(indx, x);
            break;
        }
        case 3:
        {
            GLfloat x = lua_tonumber(L, 2);
            GLfloat y = lua_tonumber(L, 3);
            glVertexAttrib2f(indx, x, y);
            break;
        }
        case 4:
        {
            GLfloat x = lua_tonumber(L, 2);
            GLfloat y = lua_tonumber(L, 3);
            GLfloat z = lua_tonumber(L, 4);
            glVertexAttrib3f(indx, x, y, z);
            break;
        }
        case 5:
        {
            GLfloat x = lua_tonumber(L, 2);
            GLfloat y = lua_tonumber(L, 3);
            GLfloat z = lua_tonumber(L, 4);
            GLfloat w = lua_tonumber(L, 5);
            glVertexAttrib4f(indx, x, y, z, w);
            break;
        }
        default:
            break;
    }
    //TODO
//    glVertexAttrib1fv(indx, values);
//    glVertexAttrib2f
//    glVertexAttrib2fv
//    glVertexAttrib3f
//    glVertexAttrib3fv
//    glVertexAttrib4f
//    glVertexAttrib4fv
    return 0;
}

static int lua_glVertexAttribPointer(lua_State *L)
{
    //TODO
//    GLuint indx = (int)lua_tointeger(L, 1);
//    GLint size = (int)lua_tointeger(L, 2);
//    GLenum type = (int)lua_tointeger(L, 3);
//    GLboolean normalized = (int)lua_tointeger(L, 4);
//    GLsizei stride = (int)lua_tointeger(L, 5);
//    glVertexAttribPointer(indx, size, type, normalized, stride, ptr);
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

static const luaL_Reg luagl_func[] = {
    {"ActiveTexture", lua_glActiveTexture},
    {"AttachShader", lua_glAttachShader},
    {"BindAttribLocation", lua_glBindAttribLocation},
    {"BindBuffer", lua_glBindBuffer},
    {"BindFramebuffer", lua_glBindFramebuffer},
    {"BindRenderbuffer", lua_glBindRenderbuffer},
    {"BindTexture", lua_glBindTexture},
    {"BlendColor", lua_glBlendColor},
    {"BlendEquation", lua_glBlendEquation},
    {"BlendEquationSeparate", lua_glBlendEquationSeparate},
    {"BlendFunc", lua_glBlendFunc},
    {"BlendFuncSeparate", lua_glBlendFuncSeparate},
    {"BufferData", lua_glBufferData},
    {"BufferSubData", lua_glBufferSubData},
    {"CheckFramebufferStatus", lua_glCheckFramebufferStatus},
    {"Clear", lua_glClear},
    {"ClearColor", lua_glClearColor},
    {"ClearDepthf", lua_glClearDepthf},
    {"ClearStencil", lua_glClearStencil},
    {"ColorMask", lua_glColorMask},
    {"CompileShader", lua_glCompileShader},
    {"CompressedTexImage2D", lua_glCompressedTexImage2D},
    {"CompressedTexSubImage2D", lua_glCompressedTexSubImage2D},
    {"CopyTexImage2D", lua_glCopyTexImage2D},
    {"CopyTexSubImage2D", lua_glCopyTexSubImage2D},
    {"CreateProgram", lua_glCreateProgram},
    {"CreateShader", lua_glCreateShader},
    {"CullFace", lua_glCullFace},
    {"DeleteBuffers", lua_glDeleteBuffers},
    {"DeleteFramebuffers", lua_glDeleteFramebuffers},
    {"DeleteProgram", lua_glDeleteProgram},
    {"DeleteRenderbuffers", lua_glDeleteRenderbuffers},
    {"DeleteShader", lua_glDeleteShader},
    {"DeleteTextures", lua_glDeleteTextures},
    {"DepthFunc", lua_glDepthFunc},
    {"DepthMask", lua_glDepthMask},
    {"DepthRangef", lua_glDepthRangef},
    {"DetachShader", lua_glDetachShader},
    {"Disable", lua_glDisable},
    {"DisableVertexAttribArray", lua_glDisableVertexAttribArray},
    {"DrawArrays", lua_glDrawArrays},
    {"DrawElements", lua_glDrawElements},
    {"Enable", lua_glEnable},
    {"EnableVertexAttribArray", lua_glEnableVertexAttribArray},
    {"Finish", lua_glFinish},
    {"Flush", lua_glFlush},
    {"FramebufferRenderbuffer", lua_glFramebufferRenderbuffer},
    {"FramebufferTexture2D", lua_glFramebufferTexture2D},
    {"FrontFace", lua_glFrontFace},
    {"GenBuffers", lua_glGenBuffers},
    {"GenerateMipmap", lua_glGenerateMipmap},
    {"GenFramebuffers", lua_glGenFramebuffers},
    {"GenRenderbuffers", lua_glGenRenderbuffers},
    {"GenTextures", lua_glGenTextures},
    {"GetActiveAttrib", lua_glGetActiveAttrib},
    {"GetActiveUniform", lua_glGetActiveUniform},
    {"GetAttachedShaders", lua_glGetAttachedShaders},
    {"GetAttribLocation", lua_glGetAttribLocation},
    {"GetBooleanv", lua_glGetBooleanv},
    {"GetBufferParameteriv", lua_glGetBufferParameteriv},
    {"GetError", lua_glGetError},
    {"GetFloatv", lua_glGetFloatv},
    {"GetFramebufferAttachmentParameteriv", lua_glGetFramebufferAttachmentParameteriv},
    {"GetIntegerv", lua_glGetIntegerv},
    {"GetProgramiv", lua_glGetProgramiv},
    {"GetProgramInfoLog", lua_glGetProgramInfoLog},
    {"GetRenderbufferParameteriv", lua_glGetRenderbufferParameteriv},
    {"GetShaderiv", lua_glGetShaderiv},
    {"GetShaderInfoLog", lua_glGetShaderInfoLog},
    {"GetShaderPrecisionFormat", lua_glGetShaderPrecisionFormat},
    {"GetShaderSource", lua_glGetShaderSource},
    {"GetString", lua_glGetString},
    {"GetTexParameter", lua_glGetTexParameter},
    {"GetUniform", lua_glGetUniform},
    {"GetUniformLocation", lua_glGetUniformLocation},
    {"GetVertexAttrib", lua_glGetVertexAttrib},
    {"GetVertexAttribPointerv", lua_glGetVertexAttribPointerv},
    {"Hint", lua_glHint},
    {"IsBuffer", lua_glIsBuffer},
    {"IsEnabled", lua_glIsEnabled},
    {"IsFramebuffer", lua_glIsFramebuffer},
    {"IsProgram", lua_glIsProgram},
    {"IsRenderbuffer", lua_glIsRenderbuffer},
    {"IsShader", lua_glIsShader},
    {"IsTexture", lua_glIsTexture},
    {"LineWidth", lua_glLineWidth},
    {"LinkProgram", lua_glLinkProgram},
    {"PixelStorei", lua_glPixelStorei},
    {"PolygonOffset", lua_glPolygonOffset},
    {"ReadPixels", lua_glReadPixels},
    {"ReleaseShaderCompiler", lua_glReleaseShaderCompiler},
    {"RenderbufferStorage", lua_glRenderbufferStorage},
    {"SampleCoverage", lua_glSampleCoverage},
    {"Scissor", lua_glScissor},
    {"ShaderBinary", lua_glShaderBinary},
    {"ShaderSource", lua_glShaderSource},
    {"StencilFunc", lua_glStencilFunc},
    {"StencilFuncSeparate", lua_glStencilFuncSeparate},
    {"StencilMask", lua_glStencilMask},
    {"StencilMaskSeparate", lua_glStencilMaskSeparate},
    {"StencilOp", lua_glStencilOp},
    {"StencilOpSeparate", lua_glStencilOpSeparate},
    {"TexImage2D", lua_glTexImage2D},
    {"TexParameter", lua_glTexParameter},
    {"TexSubImage2D", lua_glTexSubImage2D},
    {"Uniform", lua_glUniform},

    {"UniformMatrix2fv", lua_glUniformMatrix},
    {"UseProgram", lua_glUseProgram},
    {"ValidateProgram", lua_glValidateProgram},
    {"VertexAttrib", lua_glVertexAttrib},
    {"VertexAttribPointer", lua_glVertexAttribPointer},
    {"Viewport", lua_glViewport},
    {NULL, NULL},
};


LUAMOD_API int luaopen_gles (lua_State *L)
{
    luaL_newlib(L, luagl_func);
    return 1;
}


