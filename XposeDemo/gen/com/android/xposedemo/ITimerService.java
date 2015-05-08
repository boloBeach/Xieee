/*
 * This file is auto-generated.  DO NOT MODIFY.
 * Original file: C:\\Users\\royzhang\\git\\Xieee\\XposeDemo\\src\\com\\android\\xposedemo\\ITimerService.aidl
 */
package com.android.xposedemo;
public interface ITimerService extends android.os.IInterface
{
/** Local-side IPC implementation stub class. */
public static abstract class Stub extends android.os.Binder implements com.android.xposedemo.ITimerService
{
private static final java.lang.String DESCRIPTOR = "com.android.xposedemo.ITimerService";
/** Construct the stub at attach it to the interface. */
public Stub()
{
this.attachInterface(this, DESCRIPTOR);
}
/**
 * Cast an IBinder object into an com.android.xposedemo.ITimerService interface,
 * generating a proxy if needed.
 */
public static com.android.xposedemo.ITimerService asInterface(android.os.IBinder obj)
{
if ((obj==null)) {
return null;
}
android.os.IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
if (((iin!=null)&&(iin instanceof com.android.xposedemo.ITimerService))) {
return ((com.android.xposedemo.ITimerService)iin);
}
return new com.android.xposedemo.ITimerService.Stub.Proxy(obj);
}
@Override public android.os.IBinder asBinder()
{
return this;
}
@Override public boolean onTransact(int code, android.os.Parcel data, android.os.Parcel reply, int flags) throws android.os.RemoteException
{
switch (code)
{
case INTERFACE_TRANSACTION:
{
reply.writeString(DESCRIPTOR);
return true;
}
case TRANSACTION_getYear:
{
data.enforceInterface(DESCRIPTOR);
int _result = this.getYear();
reply.writeNoException();
reply.writeInt(_result);
return true;
}
case TRANSACTION_getMonth:
{
data.enforceInterface(DESCRIPTOR);
int _result = this.getMonth();
reply.writeNoException();
reply.writeInt(_result);
return true;
}
case TRANSACTION_getDay:
{
data.enforceInterface(DESCRIPTOR);
int _result = this.getDay();
reply.writeNoException();
reply.writeInt(_result);
return true;
}
}
return super.onTransact(code, data, reply, flags);
}
private static class Proxy implements com.android.xposedemo.ITimerService
{
private android.os.IBinder mRemote;
Proxy(android.os.IBinder remote)
{
mRemote = remote;
}
@Override public android.os.IBinder asBinder()
{
return mRemote;
}
public java.lang.String getInterfaceDescriptor()
{
return DESCRIPTOR;
}
@Override public int getYear() throws android.os.RemoteException
{
android.os.Parcel _data = android.os.Parcel.obtain();
android.os.Parcel _reply = android.os.Parcel.obtain();
int _result;
try {
_data.writeInterfaceToken(DESCRIPTOR);
mRemote.transact(Stub.TRANSACTION_getYear, _data, _reply, 0);
_reply.readException();
_result = _reply.readInt();
}
finally {
_reply.recycle();
_data.recycle();
}
return _result;
}
@Override public int getMonth() throws android.os.RemoteException
{
android.os.Parcel _data = android.os.Parcel.obtain();
android.os.Parcel _reply = android.os.Parcel.obtain();
int _result;
try {
_data.writeInterfaceToken(DESCRIPTOR);
mRemote.transact(Stub.TRANSACTION_getMonth, _data, _reply, 0);
_reply.readException();
_result = _reply.readInt();
}
finally {
_reply.recycle();
_data.recycle();
}
return _result;
}
@Override public int getDay() throws android.os.RemoteException
{
android.os.Parcel _data = android.os.Parcel.obtain();
android.os.Parcel _reply = android.os.Parcel.obtain();
int _result;
try {
_data.writeInterfaceToken(DESCRIPTOR);
mRemote.transact(Stub.TRANSACTION_getDay, _data, _reply, 0);
_reply.readException();
_result = _reply.readInt();
}
finally {
_reply.recycle();
_data.recycle();
}
return _result;
}
}
static final int TRANSACTION_getYear = (android.os.IBinder.FIRST_CALL_TRANSACTION + 0);
static final int TRANSACTION_getMonth = (android.os.IBinder.FIRST_CALL_TRANSACTION + 1);
static final int TRANSACTION_getDay = (android.os.IBinder.FIRST_CALL_TRANSACTION + 2);
}
public int getYear() throws android.os.RemoteException;
public int getMonth() throws android.os.RemoteException;
public int getDay() throws android.os.RemoteException;
}
