// Copyright (c) 2023, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// IMPORTANT: This file should only ever be modified by modifying the
// corresponding .proto file and then running
// `dart runtime/vm/protos/tools/compile_perfetto_protos.dart` from the SDK root
// directory.
// Autogenerated by the ProtoZero compiler plugin. DO NOT EDIT.

#ifndef PERFETTO_PROTOS_PROTOS_PERFETTO_TRACE_TRACK_EVENT_THREAD_DESCRIPTOR_PROTO_H_
#define PERFETTO_PROTOS_PROTOS_PERFETTO_TRACE_TRACK_EVENT_THREAD_DESCRIPTOR_PROTO_H_

#include <stddef.h>
#include <stdint.h>

#include "perfetto/protozero/field_writer.h"
#include "perfetto/protozero/message.h"
#include "perfetto/protozero/packed_repeated_fields.h"
#include "perfetto/protozero/proto_decoder.h"
#include "perfetto/protozero/proto_utils.h"

namespace perfetto {
namespace protos {
namespace pbzero {

class ThreadDescriptor_Decoder : public ::protozero::TypedProtoDecoder<
                                     /*MAX_FIELD_ID=*/5,
                                     /*HAS_NONPACKED_REPEATED_FIELDS=*/false> {
 public:
  ThreadDescriptor_Decoder(const uint8_t* data, size_t len)
      : TypedProtoDecoder(data, len) {}
  explicit ThreadDescriptor_Decoder(const std::string& raw)
      : TypedProtoDecoder(reinterpret_cast<const uint8_t*>(raw.data()),
                          raw.size()) {}
  explicit ThreadDescriptor_Decoder(const ::protozero::ConstBytes& raw)
      : TypedProtoDecoder(raw.data, raw.size) {}
  bool has_pid() const { return at<1>().valid(); }
  int32_t pid() const { return at<1>().as_int32(); }
  bool has_tid() const { return at<2>().valid(); }
  int32_t tid() const { return at<2>().as_int32(); }
  bool has_thread_name() const { return at<5>().valid(); }
  ::protozero::ConstChars thread_name() const { return at<5>().as_string(); }
};

class ThreadDescriptor : public ::protozero::Message {
 public:
  using Decoder = ThreadDescriptor_Decoder;
  enum : int32_t {
    kPidFieldNumber = 1,
    kTidFieldNumber = 2,
    kThreadNameFieldNumber = 5,
  };
  static constexpr const char* GetName() {
    return ".perfetto.protos.ThreadDescriptor";
  }

  using FieldMetadata_Pid = ::protozero::proto_utils::FieldMetadata<
      1,
      ::protozero::proto_utils::RepetitionType::kNotRepeated,
      ::protozero::proto_utils::ProtoSchemaType::kInt32,
      int32_t,
      ThreadDescriptor>;

  static constexpr FieldMetadata_Pid kPid{};
  void set_pid(int32_t value) {
    static constexpr uint32_t field_id = FieldMetadata_Pid::kFieldId;
    // Call the appropriate protozero::Message::Append(field_id, ...)
    // method based on the type of the field.
    ::protozero::internal::FieldWriter<
        ::protozero::proto_utils::ProtoSchemaType::kInt32>::Append(*this,
                                                                   field_id,
                                                                   value);
  }

  using FieldMetadata_Tid = ::protozero::proto_utils::FieldMetadata<
      2,
      ::protozero::proto_utils::RepetitionType::kNotRepeated,
      ::protozero::proto_utils::ProtoSchemaType::kInt32,
      int32_t,
      ThreadDescriptor>;

  static constexpr FieldMetadata_Tid kTid{};
  void set_tid(int32_t value) {
    static constexpr uint32_t field_id = FieldMetadata_Tid::kFieldId;
    // Call the appropriate protozero::Message::Append(field_id, ...)
    // method based on the type of the field.
    ::protozero::internal::FieldWriter<
        ::protozero::proto_utils::ProtoSchemaType::kInt32>::Append(*this,
                                                                   field_id,
                                                                   value);
  }

  using FieldMetadata_ThreadName = ::protozero::proto_utils::FieldMetadata<
      5,
      ::protozero::proto_utils::RepetitionType::kNotRepeated,
      ::protozero::proto_utils::ProtoSchemaType::kString,
      std::string,
      ThreadDescriptor>;

  static constexpr FieldMetadata_ThreadName kThreadName{};
  void set_thread_name(const char* data, size_t size) {
    AppendBytes(FieldMetadata_ThreadName::kFieldId, data, size);
  }
  void set_thread_name(::protozero::ConstChars chars) {
    AppendBytes(FieldMetadata_ThreadName::kFieldId, chars.data, chars.size);
  }
  void set_thread_name(std::string value) {
    static constexpr uint32_t field_id = FieldMetadata_ThreadName::kFieldId;
    // Call the appropriate protozero::Message::Append(field_id, ...)
    // method based on the type of the field.
    ::protozero::internal::FieldWriter<
        ::protozero::proto_utils::ProtoSchemaType::kString>::Append(*this,
                                                                    field_id,
                                                                    value);
  }
};

}  // namespace pbzero
}  // namespace protos
}  // namespace perfetto
#endif  // Include guard.
